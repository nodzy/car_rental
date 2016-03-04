class Car < ActiveRecord::Base
  has_many :bookings
  mount_uploader :picture, PictureUploader
  before_save :set_price
  
  


def available?
 if (self.bookings.empty? || self.bookings.any? && self.bookings.order(:from).first.from > Date.tomorrow )
  return true
  else return false
  end
end

def set_price
if self.comfort_class == "A"
self.price = 100
elsif self.comfort_class == "B"
self.price = 75
elsif self.comfort_class == "C"
self.price = 50
end

end
end
