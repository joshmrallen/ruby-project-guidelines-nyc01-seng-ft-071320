class RemoveThingsToDoAndHotspotColumnsFromLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :things_to_do
    remove_column :locations, :hotspot
  end
end
