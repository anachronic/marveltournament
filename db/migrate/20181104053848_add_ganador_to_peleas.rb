class AddGanadorToPeleas < ActiveRecord::Migration[5.2]
  def change
    add_column :peleas, :gana_heroe, :boolean, null: false
  end
end
