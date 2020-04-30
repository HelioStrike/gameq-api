class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.belongs_to :character, null: false, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
