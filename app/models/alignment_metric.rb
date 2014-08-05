class AlignmentMetric < ActiveRecord::Base
  belongs_to :read_group, foreign_key: :rg_id
  validates_presence_of :category
end