module Types
  class QuoteType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: false
    field :character, Types::CharacterType, null: false
    field :game, Types::GameType, null: false
  end
end
