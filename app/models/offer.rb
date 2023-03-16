class Offer < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:title, :category, :description]
  belongs_to :user, class_name: "User"
  has_many :bookings

  validates :title, presence: true
  validates :category, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_category,
  against: [ :title, :category, :description ],
  using: {
    tsearch: { prefix: true }
  }
end
