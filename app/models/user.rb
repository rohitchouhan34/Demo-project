class User < ApplicationRecord
    has_many :bookings , dependent: :destroy
    has_many :cabs,through: :bookings
    validates :password,confirmation: true
    validates :password_confirmation, presence: true
    has_secure_password
end
