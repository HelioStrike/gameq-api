class Mutations::CreateCharacter < Mutations::BaseMutation
  argument :name, String, required: true
  argument :gameId, Integer, required: true

  field :character, Types::CharacterType, null: false
  field :errors, [String], null: false

  def resolve(name:, gameId:)
    game = Game.find(gameId)

    if game.nil?
			return {
				character: nil,
				errors: game.errors.full_messages,
			}
    end
		
    character = Character.create(name: name, game: game)
    if character.save
      # Successful creation, return the created object with no errors
      {
        character: character,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        character: nil,
        errors: character.errors.full_messages
      }
    end
  end
end