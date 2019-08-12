class User < ApplicationRecord
    # Hashes password into password_digest.
    has_secure_password

    # Associations
    belongs_to :location
    has_many :credit_cards

    # Validations
    validates :name, length: { minimum: 2 },
                format: { with: /\A[^`!@\$%\^&*+_=]+\z/,
                    message: "only allows letters" }
    validates :phone, allow_blank: true, uniqueness: true, 
                numericality: true, length: {minimum: 7}
    validates :email, uniqueness: true,
                format: {with: URI::MailTo::EMAIL_REGEXP} 

    validates_length_of :password, maximum: 72, minimum: 8, allow_nil: true,
                        allow_blank: false
    validates_confirmation_of :password, allow_nil: true, allow_blank: false

    before_validation { (self.email = self.email.to_s.downcase) }

    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :phone
    validates_presence_of :address

    def is_admin?
        role == 'admin'
    end
end
