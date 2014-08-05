class Run < ActiveRecord::Base
  has_many :read_groups

  validates_presence_of :name
end