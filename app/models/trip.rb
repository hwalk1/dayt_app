class Trip < ApplicationRecord
  attr_accessor :search_tags

  belongs_to :user
  has_many :trip_dayts , dependent: :destroy
  has_many :dayts, through: :trip_dayts

  validates :title, presence: true
  validates :location, presence: true
  validates :distance, presence: true
  validates :date, presence: true

end
