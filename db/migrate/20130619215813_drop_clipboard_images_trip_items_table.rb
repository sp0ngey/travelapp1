class DropClipboardImagesTripItemsTable < ActiveRecord::Migration
  def up
    drop_table :clipboard_images_trip_items
  end

  def down

  end
end
