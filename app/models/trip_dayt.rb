class TripDayt < ApplicationRecord
  belongs_to :trip
  belongs_to :dayt

  enum status: {
    accepted: 0,
    declined: 1
  }
end
