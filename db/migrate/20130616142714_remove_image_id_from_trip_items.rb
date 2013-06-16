class RemoveImageIdFromTripItems < ActiveRecord::Migration
  def up
    remove_column :trip_items, :image_id
      end

  def down
    add_column :trip_items, :image_id, :integer
  end
end
