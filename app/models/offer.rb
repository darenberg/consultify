class Offer < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :bookings
end
