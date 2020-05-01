class Character < ApplicationRecord
  belongs_to :game
  has_many :quotes
end
