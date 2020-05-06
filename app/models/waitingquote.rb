class Waitingquote < ApplicationRecord
    validates :game, presence: true, allow_blank: false
    validates :character, presence: true, allow_blank: false
    validates :quote, presence: true, allow_blank: false
end
