module Types
  class GameType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    field :characters, [Types::CharacterType], null: true do
      #pagination, and cap number of characters retrieved to 20
      argument :limit, Integer, default_value: 50, required: false, prepare: ->(limit, ctx) {[limit, 50].min}
      argument :offset, Integer, default_value: 0, required: false
    end

    field :quotes, [Types::QuoteType], null: true do
      #pagination, and cap number of quotes retrieved to 20
      argument :limit, Integer, default_value: 50, required: false, prepare: ->(limit, ctx) {[limit, 50].min}
      argument :offset, Integer, default_value: 0, required: false
    end

    field :character_count, Integer, null: true
    field :quote_count, Integer, null: true

    def characters(limit:, offset:)
      object.characters.limit(limit).offset(offset)
    end

    def quotes(limit:, offset:)
      object.quotes.limit(limit).offset(offset)
    end

    def character_count
      object.characters.count
    end

    def quote_count
      object.quotes.count
    end
  end
end
