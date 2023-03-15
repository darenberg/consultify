class Booking < ApplicationRecord
  belongs_to :offer
  belongs_to :student, :class_name => :User, :foreign_key => "user_id"

  validates :start_time, presence: true
  validates :end_time, presence: true
  def teacher
    self.offer.user
  end
end
