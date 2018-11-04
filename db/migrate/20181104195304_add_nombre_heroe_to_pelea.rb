class AddNombreHeroeToPelea < ActiveRecord::Migration[5.2]
  def change
    # Almacenamos el nombre por propósitos de cache
    # para no tener que consultar la API de marvel cada vez que el usuario
    # quiere ver las peleas, pues 10 request simplemente para mostrar el
    # historial es simplemente estúpido
    add_column :peleas, :nombre_heroe, :string, null: false
  end
end
