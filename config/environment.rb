# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Travelapp::Application.initialize!

require 'rubygems' 
require 'flickr' 
MY_KEY='enter API key here' 
class Flickr 
	alias old_initialize initialize 
	def initialize(api_key=MY_KEY, email=nil, password=nil) 
		puts "new_initialize " + MY_KEY 
		old_initialize(api_key, email, password) 
		@host="http://api.flickr.com" 
		@activity_file='flickr_activity_cache.xml' 
	end 
end

