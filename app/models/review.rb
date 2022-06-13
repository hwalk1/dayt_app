class Review < ApplicationRecord
  belongs_to :trip_dayt
  has_one :dayt, through: :trip_dayt

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true, numericality: true
end
