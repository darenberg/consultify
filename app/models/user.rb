class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :teacher_offers, foreign_key: :user_id, class_name: "Offer"
  has_many :reviews, dependent: :destroy

  has_many :teacher_bookings, through: :teacher_offers, source: :bookings

  has_many :student_bookings, foreign_key: :user_id, class_name: "Booking"
end
