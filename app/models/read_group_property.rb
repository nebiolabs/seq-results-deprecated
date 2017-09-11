class ReadGroupProperty < ActiveRecord::Base
  belongs_to :read_group, inverse_of: :read_group_properties
  belongs_to :property, inverse_of: :read_group_properties

  validates_presence_of :read_group, :property, :raw_value
  validates_uniqueness_of :read_group_id, :scope => :property_id



end
