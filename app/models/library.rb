class Library < ActiveRecord::Base
  belongs_to :run
  has_many :library_properties, inverse_of: :library, dependent: :destroy
  accepts_nested_attributes_for :library_properties

  validates_presence_of :library
  validates_presence_of :barcode
  validates_presence_of :sample

  def properties=(value)

    create_parent

    value.each_key do |key|
      property = Property.find_or_create_by(:name => key)

      if is_number?(value[key])
        self.library_properties.build(:property => property, :raw_value => value[key], :numeric_value => value[key].to_f, :library_id => self)
      else
        self.library_properties.build(:property => property, :raw_value => value[key], :library_id => self)

      end


    end

  end

  def create_parent
    self.save
  end

  def is_number?(string)
    true if Float(string) rescue false
  end

end