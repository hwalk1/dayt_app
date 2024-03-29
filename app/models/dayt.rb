class Dayt < ApplicationRecord
  # These tags are used for preference selection and can be used to filted out dayts shown to the user. This is made with acts_as_taggable.js library adding functionality.
  TAGS = ["Outdoor", "Indoor", "Brekky", "Lunch", "Dinner", "Nightlife", "Nice Walk", "Art", "Sport", "Music", "Drinks", "Free", "Awesome courses", "Snacks", "Entertainment"]

  belongs_to :user
  acts_as_taggable_on :tags
  has_many :trip_dayts
  has_many :reviews, through: :trip_dayts
  has_many :trips, through: :trip_dayts
  has_many_attached :photos

  # Standard validations for creation of a Dayt
  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true
  validates :duration, presence: true, numericality: true
  validates :location, presence: true
  validates :price, presence: true, numericality: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
