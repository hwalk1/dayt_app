class Review < ApplicationRecord
  belongs_to :trip_dayt
  has_one :dayt, through: :trip_dayt
  validates :rating, presence: true, numericality: true
end
