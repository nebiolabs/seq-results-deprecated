class Run < ActiveRecord::Base
  has_many :read_groups, dependent: :destroy

  validates_presence_of :name

  def read_groups_count
    read_groups.size
  end
end