class ClipboardImage < ActiveRecord::Base
	attr_accessible :id, :url, :user_id
	#attr_reader :id
end
