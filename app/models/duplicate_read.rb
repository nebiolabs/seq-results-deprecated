class DuplicateRead < ActiveRecord::Base
  self.primary_keys = :rg_id, :fold_reads

  belongs_to :read_group, foreign_key: :rg_id

  validates_uniqueness_of :rg_id, :scope => [:fold_reads]
  validates_presence_of :rg_id
  validates_presence_of :fold_reads
  validates_presence_of :fold_unique
end