class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :cab
  before_save :add_user_driver_name

  private
  def add_user_driver_name
    self.driver_name = self.cab.driver_name
    self.user_name = self.user.first_name+" "+self.user.last_name
  end
end
