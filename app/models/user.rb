class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, foreign_key: "renter_id", class_name: "Booking"
  has_many :vehicles, foreign_key: "owner_id", class_name: "Vehicle"
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
end
