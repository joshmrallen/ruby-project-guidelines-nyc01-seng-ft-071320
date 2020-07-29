class AddTableHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.integer :location_id
      t.string :name
    end
  end
end
