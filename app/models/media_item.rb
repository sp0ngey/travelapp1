class MediaItem < ActiveRecord::Base
  belongs_to :trip_item
  belongs_to :clipboard_image
end
