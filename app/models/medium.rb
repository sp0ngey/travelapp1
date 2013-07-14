class Medium < ActiveRecord::Base
  has_many :trip_items, through: :media_items
end
