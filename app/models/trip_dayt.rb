class TripDayt < ApplicationRecord
  belongs_to :trip
  belongs_to :dayt

  validates :order, presence: true
end
