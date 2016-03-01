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

  # TODO 1: Cannot quickly find a method for this to also work with
  # :has_one. 
  def association_meta_data
    
    association_meta_data =
      ReadGroup.reflect_on_all_associations(:has_many).map do |reflection|
      {
        class_name: reflection.plural_name,
        count: self.send(reflection.plural_name).size,
        button_text: "Delete #{reflection.plural_name.gsub('_', ' ').split.map(&:capitalize).join(' ')}"
      }
    end

    reflection_plural_name = 'bedgraph_files'
    reflection_singular_name = 'bedgraph_file'
    count = self.send(reflection_singular_name).nil? ? 0 : 1

    association_meta_data << {
      class_name: reflection_plural_name,
      count: count,
      button_text: "Delete #{reflection_singular_name.gsub('_', ' ').split.map(&:capitalize).join(' ')}"
    }
    
    return association_meta_data
  end
end
