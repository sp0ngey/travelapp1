class AddTripItemIdToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :trip_item_id, :integer

  end
end
