module Types
  class CharacterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    
    field :quotes, [Module::QuoteType], null: true do
      #cap number of quotes to 50
      argument :limit, Integer, default_value: 20, prepare: ->(limit, ctx) {[limit, 30].min}
    end

    field :quote_count, Integer, null: true

    def quotes(limit:)
      object.quotes.limit(limit)
    end

    def quote_count
      object.quotes.size
    end
  end
end
