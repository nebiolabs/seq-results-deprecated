class ReadGroupProperty < ActiveRecord::Base
  belongs_to :read_group
  belongs_to :property

  validates_presence_of :read_group_id, :property_id, :raw_value
  validates_uniqueness_of :read_group_id, :scope => :property_id

end
