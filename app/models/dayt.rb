class Dayt < ApplicationRecord
  TAGS = ["Outdoor", "Indoor", "Brekky", "Lunch", "Dinner", "Nightlife", "Nice Walk", "Art", "Sport", "Music", "Drinks", "Free", "Awesome courses", "Snacks", "Entertainment"]

  belongs_to :user
  acts_as_taggable_on :tags
  acts_as_taggable_on :dayts
  has_many :trip_dayts
  has_many :reviews, through: :trip_dayts
  has_many :trips, through: :trip_dayts
  has_many_attached :photos

  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true
  validates :duration, presence: true, numericality: true
  validates :location, presence: true
  validates :price, presence: true, numericality: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
