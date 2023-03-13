class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :teacher_offers, foreign_key: :teacher_id, class_name: "Offers"
  has_many :teacher_bookings, through: :teacher_offers, source: :bookings

  has_many :student_bookings, foreign_key: :student_id, class_name: "Bookings"
end
