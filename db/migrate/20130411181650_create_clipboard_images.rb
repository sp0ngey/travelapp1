class CreateClipboardImages < ActiveRecord::Migration
  def change
    create_table :clipboard_images do |t|
      t.string :url
      t.integer :user_id

      t.timestamps
    end
  end
end
