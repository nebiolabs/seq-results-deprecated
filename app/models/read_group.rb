class ReadGroup < ActiveRecord::Base
  belongs_to :run
  has_many :gc_biases, inverse_of: :read_group
  has_many :insert_sizes, inverse_of: :read_group
  has_many :base_biases, inverse_of: :read_group
  has_many :coverage_depths, inverse_of: :read_group
  has_many :bed_coverages, inverse_of: :read_group
  has_many :duplicate_reads, inverse_of: :read_group

  validates_presence_of :library
  validates_presence_of :barcode
  validates_presence_of :sample
  validates_presence_of :project
end