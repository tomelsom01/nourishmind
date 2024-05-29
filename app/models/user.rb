class User < ApplicationRecord
  has_many :bookings
  has_many :yoga_classes, through: :bookings

  validates :name, :email, presence: true
end
