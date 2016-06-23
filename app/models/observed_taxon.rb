class ObservedTaxon < ActiveRecord::Base
  belongs_to :read_group, foreign_key: :rg_id
end