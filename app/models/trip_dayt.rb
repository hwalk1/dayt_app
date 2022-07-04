class TripDayt < ApplicationRecord
  belongs_to :trip
  belongs_to :dayt
  has_one :review
# enum status to show which tripdayt is active.
  enum status: {
    accepted: 0,
    declined: 1
  }
end
