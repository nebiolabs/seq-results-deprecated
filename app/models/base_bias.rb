class BaseBias < ActiveRecord::Base
  self.primary_keys = :rg_id, :read_position
  belongs_to :read_group, foreign_key: :rg_id

  validates_uniqueness_of :rg_id, :scope => [:read_position]
  validates_presence_of :rg_id
  validates_presence_of :read_position
  validates_presence_of :num_a
  validates_presence_of :num_c
  validates_presence_of :num_g
  validates_presence_of :num_t
  validates_presence_of :num_n
  validates_presence_of :num_x
end