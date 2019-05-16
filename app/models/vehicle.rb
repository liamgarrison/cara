class Vehicle < ApplicationRecord
  belongs_to :owner, class_name: "User"
  validates :name, presence: true
  validates :berths, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true
  validates :price_per_night, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :address, presence: true
  validates :category, presence: true, inclusion: { in: ["Campervan", "Caravan", "Trailer Tent", "Motorhome"] }
  validates :description, presence: true, length: { in: 140..500 }
end
