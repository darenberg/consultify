class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :student, class_name: "User"
  has_one :teacher, through: :offer

  validates :start_time, presence: true
  validates :end_time, presence: true
end
