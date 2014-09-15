class RunSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :instrument, :instrument_type,

             :read_groups_count

  has_many :read_groups

end
