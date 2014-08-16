class InsertSize < ActiveRecord::Base
  self.primary_keys = :rg_id, :insert_size
  belongs_to :read_group, foreign_key: :rg_id

  validates_uniqueness_of :rg_id, :scope => [:insert_size]
  validates_presence_of :rg_id
  validates_presence_of :insert_size
  validates_presence_of :fr_count
end