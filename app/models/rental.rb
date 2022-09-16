class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle

  validates :city, presence: true
end
