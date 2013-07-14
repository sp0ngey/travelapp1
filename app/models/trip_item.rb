class TripItem < ActiveRecord::Base
  belongs_to :trip
  belongs_to :location
  has_many :media, through: :media_items
  attr_accessible :trip_id, :location_id
end
