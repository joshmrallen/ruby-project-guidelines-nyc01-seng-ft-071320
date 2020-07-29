class AddColumnPoiToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :poi, :string
  end
end
