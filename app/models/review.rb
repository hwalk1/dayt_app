class Review < ApplicationRecord
  belongs_to :trip_dayt
  has_one :dayt, through: :trip_dayt
  # Standard validations for creation of a Review, this is all done at once using the Mass Review Controller
  validates :rating, presence: true, numericality: true
end
