class CoverageDepth < ActiveRecord::Base
  self.primary_keys = :rg_id, :depth, :chromosome
  belongs_to :read_group, foreign_key: :rg_id

  validates_uniqueness_of :rg_id, :scope => [:depth, :chromosome]
  validates_presence_of :rg_id
  validates_presence_of :depth
  validates_presence_of :chromosome
end