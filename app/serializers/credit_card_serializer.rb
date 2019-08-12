class CreditCardSerializer < ActiveModel::Serializer
    attributes :id, :card_number, :expiration_date, :titular_name, 
        :billing_address, :bank, :user_id

    def bank
        {bank_id: self.object.bank.id, 
         name: self.object.bank.name}
    end 
end
