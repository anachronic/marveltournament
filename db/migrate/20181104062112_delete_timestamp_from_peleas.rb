class DeleteTimestampFromPeleas < ActiveRecord::Migration[5.2]
  def change
    # Using created_at instead
    remove_column :peleas, :timestamp
  end
end
