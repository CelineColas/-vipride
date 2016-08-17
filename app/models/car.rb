class Car < ApplicationRecord
  has_attachment :photo
  belongs_to :user
  has_many :bookings

  validates :brand, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :description, presence: true
end
