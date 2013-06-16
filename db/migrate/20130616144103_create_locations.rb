class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.integer :country_id
      t.string :type
      t.string :description

      t.timestamps
    end
  end
end
