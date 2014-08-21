class ReadGroupSerializer < ActiveModel::Serializer
  embed :ids

  attributes :id, :library, :barcode, :sample

  has_one :run
end
