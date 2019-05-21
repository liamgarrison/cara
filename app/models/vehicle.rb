class Vehicle < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_many :reviews, dependent: :destroy
  has_many :renters, through: :bookings, source: :renter
  validates :name, presence: true
  validates :berths, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true
  validates :price_per_night, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: ["Campervan", "Caravan", "Trailer Tent", "Motorhome"] }
  validates :description, presence: true, length: { in: 140..500 }
  validates :photo, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
