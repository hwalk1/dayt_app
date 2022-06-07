class Dayt < ApplicationRecord
  belongs_to :user
  has_many :tags, through: :dayt_tags
  has_many :tags, through: :dayt_tags
  has_many :reviews

  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true
  validates :duration, presence: true, numericality: true
  validates :price, presence: true, numericality: true
end
