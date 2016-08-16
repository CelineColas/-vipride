class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :message, presence: true
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

end
