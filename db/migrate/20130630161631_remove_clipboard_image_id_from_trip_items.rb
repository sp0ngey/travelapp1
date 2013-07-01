class RemoveClipboardImageIdFromTripItems < ActiveRecord::Migration
  def up
    remove_column :trip_items, :clipboard_image_id
      end

  def down
    add_column :trip_items, :clipboard_image_id, :integer
  end
end
