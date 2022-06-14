class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dayts
  has_many :trips, dependent: :destroy
  has_one_attached :avatar

  validates :name, presence: true

  # TAGS ===>
  acts_as_taggable_on :tags
  acts_as_taggable_on :dayts

DISTANCE_KM = ["5 km", "10 km", "15 km", "20 km", "25 km", "30 km", "50 km", "100 km",]
DISTANCE = [5 , 10 , 15 , 20 , 25 , 30 , 50 , 100]

end
