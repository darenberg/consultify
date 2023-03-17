class Review < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  validates :content, length: {minimum: 5, maximum: 140}
end
