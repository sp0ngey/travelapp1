class RemoveLocationIdFromClipboardImages < ActiveRecord::Migration
  def up
    remove_column :clipboard_images, :location_id
      end

  def down
    add_column :clipboard_images, :location_id, :integer
  end
end
