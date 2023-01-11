class User < ApplicationRecord
    has_many :bookings
    has_many :cabs,through: :bookings
    validates :password,confirmation: true
    validates :password_confirmation, presence: true
end
