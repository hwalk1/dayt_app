class TripDayt < ApplicationRecord
  belongs_to :trip
  belongs_to :dayt
  has_one :review

  enum status: {
    accepted: 0,
    declined: 1
  }
end
