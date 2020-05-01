class Mutations::CreateGame < Mutations::BaseMutation
  argument :name, String, required: true

  field :game, Types::GameType, null: false
  field :errors, [String], null: false

  def resolve(name:)
    game = Game.new(name: name)
    if game.save
      # Successful creation, return the created object with no errors
      {
        game: game,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        game: nil,
        errors: game.errors.full_messages,
      }
    end
  end
end