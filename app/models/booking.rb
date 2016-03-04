class Booking < ActiveRecord::Base
  belongs_to :car
  
  # attr_accessor :how_long
  
  # validates :how_long, inclusion: {in: 1..365, :message => "cannot be negative. Between 1 day and 1 year"}
  # validates :car, presence: true
  # validates :customer, presence: true
  # validate :period_not_overlapped

  # def how_long
    # self.from - self.to
  # end

  # def start_time

   # self.start

  # end



  # private
  # def period_not_overlapped
    # unless Rental.where(
        # 'car_id==? AND ((start <= ? AND end >= ?) OR (start >= ? AND end <= ?))',
       # car, self.start, self.start,
        # self.start, self.end
    # ).empty?
      # errors.add(:start, 'This car is unavaialbe on this period.')
    # end
  # end


# end
  
  
  
  
def self.remove_bookings
 self.where{ to < Date.today }.destroy_all if self.where{ to < Date.today }
  

end

end
