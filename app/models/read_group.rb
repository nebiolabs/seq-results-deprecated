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

  validates_presence_of :library
  validates_presence_of :barcode
  validates_presence_of :sample

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
        class_name: reflection.name,
        # Cannot quickly find a way to get self.send(reflection.name)
        # to return the actual count, resorting to this special case:
        count: self.send(reflection.name).nil? ? 0 : 1,
        # reflection.name.gsub fails even though
        # reflection.plural_name.gsub works, resorting to to_s:
        button_text: "Delete #{reflection.name.to_s.gsub('_', ' ').split.map(&:capitalize).join(' ')}"
      }
    end
    
    return has_many_association_meta_data + has_one_association_meta_data
  end
end
