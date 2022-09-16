class User < ApplicationRecord
    has_many :motorcycles, dependent: :destroy
    has_many :rentals, dependent: :destroy
end
