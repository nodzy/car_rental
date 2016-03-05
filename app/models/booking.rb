class Booking < ActiveRecord::Base
  belongs_to :car
  
  #attr_accessor :how_long
  
 validates :how_long, inclusion: {in: 1..365, :message => "cannot be negative. Between 1 day and 1 year"}
  validates :client, presence: true, length: { maximum: 30 }
  validates :place, presence: true
  validates :phone, presence: true, length: { maximum: 12 }
 
  # validates :customer, presence: true
  validate :date_range

   def how_long
    self.ending - self.starting
  end






  
 private


def date_range
 unless Booking.where(
        'car_id==? AND ((starting <= ? AND ending >= ?) OR (starting >= ? AND ending <= ?))',
       self.car_id, self.starting, self.starting,
        self.starting, self.ending
    ).empty?
      errors.add(:start, 'This car is unavaialbe on this period.')
    end
end
 
 

  
  
  
  
  
  
def self.remove_bookings
 self.where{ endingo < Date.today }.destroy_all if self.where{ ending < Date.today }
  

end

end
