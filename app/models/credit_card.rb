class CreditCard < ApplicationRecord
    # Associations
    belongs_to :user
    belongs_to :bank

    before_validation { (self.card_number = self.card_number.to_s[-4..-1])}
    # Validations
    validates :card_number, uniqueness: true, allow_blank: false ,
                numericality: true, length: {minimum: 4, maximum: 4}

    validates_presence_of :card_number
    validates_presence_of :expiration_date
    validates_presence_of :titular_name
    validates_presence_of :billing_address
end
