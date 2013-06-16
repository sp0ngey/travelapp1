class TripItem < ActiveRecord::Base
  belongs_to :trip
  has_one :location
  attr_accessible :trip_id, :location_id
end
