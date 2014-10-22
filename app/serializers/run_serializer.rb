class RunSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :instrument_type, :instrument_name,

             :read_groups_count,
             :read_groups_data

  has_many :read_groups

  def instrument_name
    ### active mode serializer is bugged, cannot use an attribute defined as instrument
    object.instrument
  end
end
