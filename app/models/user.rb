class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cars
  has_many :bookings # as renter
  has_many :received_bookings, through: :cars, source: :bookings # as owner
  has_attachment :photo

  validates :name, presence: true, on: :update
  validates :address, presence: true, on: :update
end
