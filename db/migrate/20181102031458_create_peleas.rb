class CreatePeleas < ActiveRecord::Migration[5.2]
  def change
    create_table :peleas do |t|
      t.integer :persona_id
      t.integer :heroe_id
      t.datetime :timestamp

      t.timestamps
    end
  end
end
