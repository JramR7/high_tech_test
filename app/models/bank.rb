class Bank < ApplicationRecord
    #Associations
    has_many :credit_cards

    before_validation { (self.name = self.name.to_s.downcase)}

    validates_presence_of :name
    
    validates_uniqueness_of :name
end
