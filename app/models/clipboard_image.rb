class ClipboardImage < ActiveRecord::Base
  has_many :trip_items, through: :media_items

	attr_accessible :id, :url
	#attr_reader :id
end
