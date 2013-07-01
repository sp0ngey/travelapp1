class RemoveTripItemFromMediaItems < ActiveRecord::Migration
  def up
    remove_column :media_items, :trip_item
      end

  def down
    add_column :media_items, :trip_item, :integer
  end
end
