class CreateTripItems < ActiveRecord::Migration
  def change
    create_table :trip_items do |t|
      t.integer :trip_id
      t.integer :image_id
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :comment

      t.timestamps
    end
  end
end
