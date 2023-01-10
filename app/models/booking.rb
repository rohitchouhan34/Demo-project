class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cab
  before_create :add_user_driver_name

  # private
  # def add_user_driver_name
  #   self.driver_name = self.cab.driver_name
  #   self.user_name = self.user.name
  # end
end
