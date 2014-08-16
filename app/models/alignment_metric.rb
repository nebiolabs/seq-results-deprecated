class AlignmentMetric < ActiveRecord::Base
  self.primary_keys = :rg_id, :category
  belongs_to :read_group, foreign_key: :rg_id

  validates_uniqueness_of :rg_id, :scope => [:category]
  validates_presence_of :rg_id
  validates_presence_of :category
end