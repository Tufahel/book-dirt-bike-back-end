class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :motorcycle
end
