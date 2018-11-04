class AddPuntosToPersona < ActiveRecord::Migration[5.2]
  def change
    add_column :personas, :puntos, :integer, default: 0
  end
end
