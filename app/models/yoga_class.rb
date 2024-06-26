class YogaClass < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :title, :start_time, :end_time, presence: true
end
