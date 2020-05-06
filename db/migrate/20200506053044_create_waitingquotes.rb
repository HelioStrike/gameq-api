class CreateWaitingquotes < ActiveRecord::Migration[6.0]
  def change
    create_table :waitingquotes do |t|
      t.string :game
      t.string :character
      t.string :quote
      t.integer :pos
      t.integer :neg

      t.timestamps
    end
  end
end
