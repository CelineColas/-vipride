class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cars
  has_many :bookings # as renter
  has_many :received_bookings, through: :cars, source: :bookings # as owner

  validates :name, presence: true
  validates :address, presence: true
end
