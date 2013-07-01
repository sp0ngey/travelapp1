class AddLocationIdToClipboardImages < ActiveRecord::Migration
  def change
    add_column :clipboard_images, :location_id, :integer
  end
end
