class Tag < ApplicationRecord

  has_many :dayts, through: :dayt_tags

  validates :name, presence: true
end
