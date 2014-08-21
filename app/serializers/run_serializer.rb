class RunSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :name, :date, :instrument, :instrument_type

  has_many :read_groups, include: true
end
