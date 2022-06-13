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

end
