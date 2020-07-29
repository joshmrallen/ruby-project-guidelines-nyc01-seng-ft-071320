class RemoveHotspotFromLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :hotspot
  end
end
