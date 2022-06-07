class Trip < ApplicationRecord
  belongs_to :user
  has_many :trip_dayts
  has_many :dayts, through: :trip_dayts

  validates :title, presence: true

end
