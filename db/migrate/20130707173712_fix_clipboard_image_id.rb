class FixClipboardImageId < ActiveRecord::Migration
  def up
    rename_column :media_items, :clipboard_image_id, :medium_id
  end

  def down
  end
end
