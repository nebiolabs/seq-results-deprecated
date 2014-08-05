class CoverageDepth < ActiveRecord::Base
  belongs_to :read_group, foreign_key: :rg_id

  validates_presence_of :depth
  validates_presence_of :chromosome
end