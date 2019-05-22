class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :comment, presence: true, allow_blank: false, length: { minimum: 30, maximum: 1000 }
end
