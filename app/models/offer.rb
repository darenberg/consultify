class Offer < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :bookings

  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true
end
