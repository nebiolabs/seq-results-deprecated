class Run < ActiveRecord::Base
  has_many :read_groups, dependent: :destroy

  validates_presence_of :name
end