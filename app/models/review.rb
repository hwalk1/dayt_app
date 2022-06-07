class Review < ApplicationRecord
  belongs_to :dayt
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, presence: true, numericality: true
end
