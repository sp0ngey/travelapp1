class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.integer :trip_item
      t.integer :clipboard_image_id

      t.timestamps
    end
  end
end
