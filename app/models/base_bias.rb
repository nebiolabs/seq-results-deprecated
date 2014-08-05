class BaseBias < ActiveRecord::Base
  belongs_to :read_group, foreign_key: :rg_id

  validates_presence_of :read_position
  validates_presence_of :num_a
  validates_presence_of :num_c
  validates_presence_of :num_g
  validates_presence_of :num_t
  validates_presence_of :num_n
  validates_presence_of :num_x
end