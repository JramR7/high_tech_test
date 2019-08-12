class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :phone, :address, :email, :role, 
        :location

    def location
        {country_code: self.object.location.country_code, 
         country: self.object.location.country,
         city: self.object.location.city}
    end 
end
