class BedRegion < ActiveRecord::Base
  has_many :bed_coverages, inverse_of: :bed_region, foreign_key: [:rg_id, :bed_id]
end