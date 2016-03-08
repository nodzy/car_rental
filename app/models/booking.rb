class Booking < ActiveRecord::Base
  belongs_to :car

  validates :must_be_greater_than_one_day, inclusion: { in: 1..365, message: '- Choose between 1 day and 1 year' }
  validates :client, presence: true, length: { maximum: 30 }
  validates :place, presence: true
  validates :phone, presence: true, length: { maximum: 15 }
  validate :date_range, on: :create
  validate :date_range_edit, on: :update

  def must_be_greater_than_one_day
    ending - starting
 end

  private

  def date_range
    unless Booking.where('car_id = ? AND ((starting <= ? AND ending >= ?) OR (starting >= ? AND ending <= ?) OR (starting <= ? AND ending >= ?))',
                         car_id, starting, starting,
                         starting, ending, ending, ending).empty?
      errors.add(:base, 'Car is unavailable, choose other dates')
       end
  end

  def date_range_edit
    unless Booking.where('car_id = ? AND id <> ? AND ((starting <= ? AND ending >= ?) OR (starting >= ? AND ending <= ?) OR (starting <= ? AND ending >= ?))',
                         car_id, id, starting, starting,
                         starting, ending, ending, ending).empty?
      errors.add(:base, 'Car is unavailable, choose other dates')
       end
end

  def self.remove_bookings
    where { ending < Date.today }.destroy_all if where { ending < Date.today }.any?
    end
end
