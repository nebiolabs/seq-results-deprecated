class Property < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :read_group_properties, inverse_of: :property,  dependent: :destroy
  has_many :library_properties, inverse_of: :property,  dependent: :destroy

end
