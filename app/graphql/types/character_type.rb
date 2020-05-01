module Types
  class CharacterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :game, Types::GameType, null: false
    
    field :quotes, [Types::QuoteType], null: true do
      #pagination, and cap number of quotes retrieved to 50
      argument :limit, Integer, default_value: 50, required: false, prepare: ->(first, ctx) {[first, 50].min}
      argument :offset, Integer, default_value: 0, required: false
    end

    field :quote_count, Integer, null: true

    def quotes(limit:, offset:)
      object.quotes.limit(limit).offset(offset)
    end

    def quote_count
      object.quotes.size
    end
  end
end
