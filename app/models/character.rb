class Character < ApplicationRecord
  belongs_to :game, validate: true
  has_many :quotes
end
