class AddSourceToClipboardImages < ActiveRecord::Migration
  def change
    add_column :clipboard_images, :source, :string

  end
end
