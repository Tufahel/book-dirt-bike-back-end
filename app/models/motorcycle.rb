class Motorcycle < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy

  validates :bike_name, presence: true
  validates :details, presence: true
  validates :image, presence: true
  validates :amount, presence: true
end
