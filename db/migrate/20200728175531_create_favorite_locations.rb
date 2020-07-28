class CreateFavoriteLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_locations do |t|
      t.integer :location_id
      t.integer :user_id
    end
  end
end
