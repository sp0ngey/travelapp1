class ClipboardImage < ActiveRecord::Base
  has_many :media_items

	attr_accessible :id, :url
	#attr_reader :id
end
