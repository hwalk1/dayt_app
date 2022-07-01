class Trip < ApplicationRecord
  attr_accessor :search_tags

  belongs_to :user, optional: true
  has_many :trip_dayts, dependent: :destroy

  has_many :dayts, through: :trip_dayts
  has_many :reviews, -> { distinct }, through: :trip_dayts

  validates :title, presence: true
  validates :location, presence: true
  validates :distance, presence: true
  validates :date, presence: true
  accepts_nested_attributes_for :reviews

  acts_as_taggable_on :tags

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
