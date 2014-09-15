class LibraryComplexity < ActiveRecord::Base
  belongs_to :read_group, foreign_key: :rg_id

  self.primary_keys = :rg_id

  validates_presence_of :rg_id
  validates_presence_of :unpaired_reads_examined
  validates_presence_of :read_pairs_examined
  validates_presence_of :unmapped_reads
  validates_presence_of :unpaired_read_duplicates
  validates_presence_of :read_pair_duplicates
  validates_presence_of :read_pair_optical_duplicates
  validates_presence_of :percent_duplication
  validates_presence_of :estimated_library_size
end