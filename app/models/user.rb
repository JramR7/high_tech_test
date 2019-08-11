class User < ApplicationRecord
    # Hashes password into password_digest.
    has_secure_password

    validates_length_of :password, maximum: 72, minimum: 8, allow_nil: false,
                        allow_blank: false
    validates_confirmation_of :password, allow_nil: false, allow_blank: false

    before_validation { (self.email = self.email.to_s.downcase) }

    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :phone
    validates_presence_of :address
    
    validates_uniqueness_of :email
    validates_uniqueness_of :phone

    def is_admin?
        role == 'admin'
    end
end
