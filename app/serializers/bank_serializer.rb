class BankSerializer < ActiveModel::Serializer
    attributes Bank.new.attributes.keys
end
