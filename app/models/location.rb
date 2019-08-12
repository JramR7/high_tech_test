class Location < ApplicationRecord
    #Associations
    has_many :users

    before_validation { (self.country = self.country.to_s.downcase) && 
    (self.city = self.city.to_s.downcase)}

    validates_presence_of :country_code
    validates_presence_of :country
    validates_presence_of :city
end 
