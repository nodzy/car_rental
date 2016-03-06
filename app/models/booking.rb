class Booking < ActiveRecord::Base
  belongs_to :car



  validates :booking_length, inclusion: { in: 1..365, message: 'Choose date between 1 day and 1 year' }
  validates :client, presence: true, length: { maximum: 30 }
  validates :place, presence: true
  validates :phone, presence: true, length: { maximum: 15 }
  validate :date_range

  def booking_length
    self.ending - self.starting
 end



  private

  def date_range
    unless Booking.where(
      'car_id==? AND ((starting <= ? AND ending >= ?) OR (starting >= ? AND ending <= ?))',
      car_id, starting, starting,
      starting, ending
    ).empty?
      errors.add(:base, 'This car is unavailabe in this period.')
       end
  end


  def self.remove_bookings
    where { endingo < Date.today }.destroy_all if where { ending < Date.today }
    end
end
