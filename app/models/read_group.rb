class ReadGroup < ActiveRecord::Base
  belongs_to :run
  has_many :gc_biases, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :insert_sizes, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :base_biases, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :coverage_depths, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :bed_coverages, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :duplicate_reads, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :alignment_metrics, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy
  has_many :library_complexities, inverse_of: :read_group, foreign_key: [:rg_id], dependent: :destroy

  validates_presence_of :library
  validates_presence_of :barcode
  validates_presence_of :sample

  def gc_biases_count
    gc_biases.count
  end

  def insert_sizes_count
    insert_sizes.count
  end

  def base_biases_count
    base_biases.count
  end

  def coverage_depths_count
    coverage_depths.count
  end

  def bed_coverages_count
    bed_coverages.count
  end

  def duplicate_reads_count
    duplicate_reads.count
  end

  def alignment_metrics_count
    alignment_metrics.count
  end

  def library_complexities_count
    library_complexities.count
  end
end