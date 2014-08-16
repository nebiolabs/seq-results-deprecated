class ReadGroup < ActiveRecord::Base
  belongs_to :run
  has_many :gc_biases, inverse_of: :read_group, foreign_key: [:rg_id, :pct_gc]
  has_many :insert_sizes, inverse_of: :read_group, foreign_key: [:rg_id, :insert_sizes]
  has_many :base_biases, inverse_of: :read_group, foreign_key: [:rg_id, :read_position]
  has_many :coverage_depths, inverse_of: :read_group, foreign_key: [:rg_id, :depth, :chromosome]
  has_many :bed_coverages, inverse_of: :read_group, foreign_key: [:rg_id, :bed_id]
  has_many :duplicate_reads, inverse_of: :read_group, foreign_key: [:rg_id, :fold_reads]

  validates_presence_of :library
  validates_presence_of :barcode
  validates_presence_of :sample
  validates_presence_of :project
end