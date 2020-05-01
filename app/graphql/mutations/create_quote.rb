class Mutations::CreateQuote < Mutations::BaseMutation
  argument :text, String, required: true
  argument :characterId, Integer, required: true

  field :quote, Types::QuoteType, null: false
  field :errors, [String], null: false

  def resolve(text:, characterId:)
    character = Character.find(characterId)
    if character.nil?
      return {
        quote: nil,
        errors: character.errors.full_messages,
      }
    end
		
    quote = Quote.new(text: text, character: character, game: character.game)
		game = character.game.update(quotes: character.game.quotes + [quote])
    character = character.update(quotes: character.quotes + [quote])
    if quote.save
      # Successful creation, return the created object with no errors
      {
        quote: quote,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        quote: nil,
        errors: quote.errors.full_messages + game.errors.full_messages + character.errors.full_messages,
      }
    end
  end
end