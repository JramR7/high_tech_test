class LocationSerializer < ActiveModel::Serializer
    attributes Location.new.attributes.keys
end