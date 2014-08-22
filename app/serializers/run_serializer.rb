class RunSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :instrument, :instrument_type

  has_many :read_groups
end
