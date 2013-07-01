class AddClipboardImageIdToTripItems < ActiveRecord::Migration
  def change
    add_column :trip_items, :clipboard_image_id, :integer

  end
end
