class RunSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :instrument, :instrument_type
end
