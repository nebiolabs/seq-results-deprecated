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

  validates_presence_of :library
  validates_presence_of :barcode
  validates_presence_of :sample

  def association_meta_data
    ReadGroup.reflect_on_all_associations(:has_many).map do |reflection|
      {
        class_name: reflection.plural_name,
        count: self.send(reflection.plural_name).count,
        button_text: "Delete #{reflection.plural_name.gsub('_', ' ').split.map(&:capitalize).join(' ')}"
      }
    end
  end
end