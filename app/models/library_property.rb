class LibraryProperty < ActiveRecord::Base
  belongs_to :library, inverse_of: :library_properties
  belongs_to :property, inverse_of: :library_properties

  validates_presence_of :library_id, :property_id, :raw_value
  validates_uniqueness_of :library_id, :scope => :property_id



end