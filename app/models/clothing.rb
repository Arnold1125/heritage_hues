class Clothing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
  validates :photo, presence: true
  validate :correct_image_mime_type

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def correct_image_mime_type
    if photo.attached? && !photo.content_type.in?(%('image/png image/jpeg image/jpg'))
      errors.add(:photo, 'must be a PNG, JPG, or JPEG image')
    elsif photo.attached? == false
      errors.add(:photo, 'must be attached')
    end
  end
end
