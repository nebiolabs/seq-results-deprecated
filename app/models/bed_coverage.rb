class BedCoverage < ActiveRecord::Base
  self.primary_keys = :rg_id, :bed_id
  belongs_to :read_group, foreign_key: :rg_id
  belongs_to :bed_region, foreign_key: :bed_id

  validates_uniqueness_of :rg_id, :scope => [:bed_id]
  validates_presence_of :rg_id
  validates_presence_of :bed_id
end