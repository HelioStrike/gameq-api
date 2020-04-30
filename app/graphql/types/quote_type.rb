module Types
  class QuoteType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: false
  end
end
