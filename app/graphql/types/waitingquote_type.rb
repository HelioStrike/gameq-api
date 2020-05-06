module Types
    class WaitingquoteType < Types::BaseObject
      field :id, ID, null: false
      field :game, String, null: false
      field :character, String, null: false
      field :quote, String, null: false
      field :pos, Integer, null: false
      field :neg, Integer, null: false
    end
  end
  