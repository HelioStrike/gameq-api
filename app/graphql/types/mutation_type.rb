module Types
  class MutationType < Types::BaseObject
    field :create_game, mutation: Mutations::CreateGame
    field :create_character, mutation: Mutations::CreateCharacter
    field :create_quote, mutation: Mutations::CreateQuote
  end
end
