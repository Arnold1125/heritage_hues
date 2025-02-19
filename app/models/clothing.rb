class Clothing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :price, presence: true
  validates :size, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
