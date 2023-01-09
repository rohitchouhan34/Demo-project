class User < ApplicationRecord
    has_many :bookings
    has_many :cabs,through: :bookings
end
