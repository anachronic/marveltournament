class SetPersonaDefaultStatusToTrue < ActiveRecord::Migration[5.2]
  def change
    change_column :personas, :alive, :boolean, default: true
  end
end
