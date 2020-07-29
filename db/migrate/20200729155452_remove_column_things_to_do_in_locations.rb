class RemoveColumnThingsToDoInLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :things_to_do
  end
end
