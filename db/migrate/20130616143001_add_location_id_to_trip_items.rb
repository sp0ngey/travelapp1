class AddLocationIdToTripItems < ActiveRecord::Migration
  def change
    add_column :trip_items, :location_id, :integer

  end
end
