module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :characters, [Types::CharacterType], null: true
    
    field :quotes, [Types::QuoteType], null: true do
      #cap number of quotes to 50
      argument :limit, Integer, default_value: 20, prepare: ->(limit, ctx) {[limit, 30].min}
    end

    field :character_count, Integer, null: true
    field :quote_count, Integer, null: true

    def quotes(limit:)
      object.quotes.limit(limit)
    end

    def character_count
      object.characters.count
    end

    def quote_count
      object.quotes.count
    end
  end
end
