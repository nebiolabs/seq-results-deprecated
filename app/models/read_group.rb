class ReadGroup < ActiveRecord::Base
  belongs_to :run
  has_many :gc_biases, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :insert_sizes, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :base_biases, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :coverage_depths, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :bed_coverages, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :duplicate_reads, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :duplicate_groups, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :alignment_metrics, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :library_complexities, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_one :bedgraph_file, inverse_of: :read_group, dependent: :destroy
  has_many :per_transcript_coverages, inverse_of: :read_group, dependent: :destroy
  has_many :transcript_abundances, inverse_of: :read_group, dependent: :destroy
  has_many :rna_seq_metrics, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :observed_taxa, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :read_group_properties, inverse_of: :read_group, dependent: :destroy
  accepts_nested_attributes_for :read_group_properties

  validates_presence_of :library
  validates_presence_of :barcode
  validates_presence_of :sample


  def properties=(value)
    create_parent

    value.each_key do |key|
      property = Property.find_or_create_by(:name => key)

      if is_number?(value[key])
        self.read_group_properties.build(:property => property, :raw_value => value[key], :numeric_value => value[key].to_f, :read_group_id => self)
      else
        self.read_group_properties.build(:property => property, :raw_value => value[key], :read_group_id => self)

      end


    end

  end

  def create_parent
    self.save
  end

  def is_number?(string)
    true if Float(string) rescue false
  end


  # The method is used in making the "Delete" buttons to remove data
  # associated with read group model, and maybe in other places.
  # Cannot quickly find a way to treat all the associations of a model
  # in a generic way, even though this should be a common
  # operation. Resorting to special cases.

  def association_meta_data

    has_many_association_meta_data =
      ReadGroup.reflect_on_all_associations(:has_many).map do |reflection|
      {
        class_name: reflection.plural_name,
        count: self.send(reflection.plural_name).size,
        button_text: "Delete #{reflection.plural_name.gsub('_', ' ').split.map(&:capitalize).join(' ')}"
      }
    end

    has_one_association_meta_data =
      ReadGroup.reflect_on_all_associations(:has_one).map do |reflection|
      {
        # class_name value must be a string, not symbol:
        class_name: reflection.name.to_s,
        # Cannot quickly find a way to get self.send(reflection.name)
        # to return the actual count, resorting to this special case:
        count: self.send(reflection.name).nil? ? 0 : 1,
        # reflection.name.gsub fails even though
        # reflection.plural_name.gsub works, resorting to to_s:
        button_text: "Delete #{reflection.name.to_s.gsub('_', ' ').split.map(&:capitalize).join(' ')}"
      }
    end

    # class_name value must be a string, not symbol:
    skip_classes = %w(bedgraph_file)
    all_association_meta_data = 
    (has_many_association_meta_data +
     has_one_association_meta_data
    ).reject { |a| skip_classes.include?(a[:class_name]) }
    puts "all_association_meta_data=#{all_association_meta_data.inspect}"
    
    return all_association_meta_data
  end
end
