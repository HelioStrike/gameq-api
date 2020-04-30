class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
