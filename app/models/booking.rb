class Booking < ApplicationRecord
  belongs_to :clothing
  belongs_to :user
end
