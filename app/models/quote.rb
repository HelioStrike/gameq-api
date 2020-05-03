class Quote < ApplicationRecord
  belongs_to :game, validate: true
  belongs_to :character, validate: true
end
