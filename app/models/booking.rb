class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :vehicle
  has_many :reviews
  validates :start_date, presence: true
  validates :number_of_nights, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
