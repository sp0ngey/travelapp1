class Location < ActiveRecord::Base
  belongs_to :country
  has_many :trip_items
end
