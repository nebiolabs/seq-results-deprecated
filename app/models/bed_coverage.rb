class BedCoverage < ActiveRecord::Base
  belongs_to :read_group, foreign_key: :rg_id
  belongs_to :bed_region, foreign_key: :bed_id
end