class Offer < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true

  validates :price,  numericality: { only_decimal: true }

  validates :price, presence: true
  validates :price, numericality: { only_decimal: true }

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_category,
  against: [ :title, :category, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
