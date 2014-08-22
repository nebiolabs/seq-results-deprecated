class ReadGroupSerializer < ActiveModel::Serializer
  attributes :id, :library, :barcode, :sample

  has_one :run
end
