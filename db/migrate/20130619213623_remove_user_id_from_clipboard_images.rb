class RemoveUserIdFromClipboardImages < ActiveRecord::Migration
  def up
    remove_column :clipboard_images, :user_id
      end

  def down
    add_column :clipboard_images, :user_id, :integer
  end
end
