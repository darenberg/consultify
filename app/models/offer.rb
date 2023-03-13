class Offer < ApplicationRecord
  belongs_to :teacher, class_name: "User"
  has_many :bookings

end
