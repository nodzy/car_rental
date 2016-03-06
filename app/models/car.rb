class Car < ActiveRecord::Base
  has_many :bookings
  mount_uploader :picture, PictureUploader
  before_save :set_price
  validates :name, presence: true, length: { maximum: 20 }
  validates :comfort_class, presence: true
  validates :description, presence: true, length: { maximum: 100 }
  validate  :picture_size

  def available?
    if bookings.empty? || bookings.any? && bookings.order(:starting).first.starting > Date.tomorrow
      return true
    else return false
     end
  end

  private

  def set_price
    if comfort_class == 'A'
      self.price = 100
    elsif comfort_class == 'B'
      self.price = 75
    elsif comfort_class == 'C'
      self.price = 50
    end
    end

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, 'should be less than 5MB')
    end
  end
end
