class CreateClipboardImagesTripItemsJoinTable < ActiveRecord::Migration
  def up
    create_table :clipboard_images_trip_items, :id => false do |t|
      t.integer :clipboard_image_id
      t.integer :trip_item_id
    end
  end

  def down
    drop_table :clipboard_images_trip_items
  end
end
