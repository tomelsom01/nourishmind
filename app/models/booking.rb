class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :yoga_class
  validates :user_id, :yoga_class_id, presence: true
end
