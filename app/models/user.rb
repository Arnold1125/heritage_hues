class User < ApplicationRecord
  has_many :bookings
  has_many :clothings
  has_many :owner_bookings, through: :clothings, source: :bookings

  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
