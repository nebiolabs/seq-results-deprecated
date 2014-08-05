class InsertSize < ActiveRecord::Base
  belongs_to :read_group, foreign_key: :rg_id
  validates_presence_of :insert_size
  validates_presence_of :fr_count
end