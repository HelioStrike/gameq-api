module Types
  class QueryType < Types::BaseObject

    # Get list of games
    field :games, [Types::GameType], null: false do
      argument :limit, Integer, default_value: 100, required: false
      argument :offset, Integer, default_value: 0, required: false
    end

    def games(limit:, offset:)
      Game.limit(limit).offset(offset)
    end

    # Get list of characters
    field :characters, [Types::CharacterType], null: false do
      argument :limit, Integer, default_value: 50, required: false, prepare: ->(first, ctx) {[first, 50].min}
      argument :offset, Integer, default_value: 0, required: false
    end

    def characters(limit:, offset:)
      Character.limit(limit).offset(offset)
    end
    
    # Get list of quotes
    field :quotes, [Types::QuoteType], null: false do
      argument :limit, Integer, default_value: 50, required: false, prepare: ->(first, ctx) {[first, 50].min}
      argument :offset, Integer, default_value: 0, required: false
    end

    def quotes(limit:, offset:)
      Quote.limit(limit).offset(offset)
    end

    # Get list of waiting quotes
    field :waitingquotes, [Types::WaitingquoteType], null: false do
      argument :limit, Integer, default_value: 50, required: false, prepare: ->(first, ctx) {[first, 50].min}
      argument :offset, Integer, default_value: 0, required: false
    end

    def waitingquotes(limit:, offset:)
      Waitingquote.limit(limit).offset(offset)
    end
    
    # Get game by ID
    field :game_by_id, Types::GameType, null: false do
      argument :id, ID, required: true
    end
    
    def game_by_id(id:)
      Game.find(id)
    end

    /
    # Get game by name
    field :game_by_name, Types::GameType, null: false do
      argument :name, String, required: true
    end
    
    def game_by_name(name:)
      Game.where(name: name)
    end
    /

    # Get character by ID
    field :character, Types::CharacterType, null: false do
      argument :id, ID, required: true
    end
    
    def character(id:)
      Character.find(id)
    end

    # Get quote by ID
    field :quote, Types::QuoteType, null: false do
      argument :id, ID, required: true
    end
    
    def quote(id:)
      Quote.find(id)
    end

  end
end
