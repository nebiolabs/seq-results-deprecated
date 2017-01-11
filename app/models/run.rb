class Run < ActiveRecord::Base
  has_many :read_groups, dependent: :destroy
  has_many :libraries

  validates_presence_of :name
  validates_uniqueness_of :flowcell

  def read_groups_count
    read_groups.size
  end

  def read_groups_data
    read_groups.pluck(
      :library,
      :barcode,
      :sample,
      :project,
      :library_prep_method,
      :shearing_method,
      :contact_email,
      :notebook_location,
      :pre_denaturation_buffer
    ).flatten.uniq.join(',')
  end
end