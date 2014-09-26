class DuplicateGroup < ActiveRecord::Base
  self.primary_keys = :rg_id, :duplication_group

  belongs_to :read_group, foreign_key: :rg_id

  validates_uniqueness_of :rg_id, :scope => [:duplication_group]
  validates_presence_of :rg_id
  validates_presence_of :duplication_group
  validates_presence_of :num_reads
end