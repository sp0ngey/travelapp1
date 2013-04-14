# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Travelapp::Application.initialize!

# This is where you initialise the Flickr API. Need to include Flickr API key here.
require 'rubygems' 
require 'flickr' 
MY_KEY='6aac58d0b8b98bf60604ac3218771a08'
class Flickr 
	alias old_initialize initialize 
	def initialize(api_key=MY_KEY, email=nil, password=nil) 
		puts "new_initialize " + MY_KEY 
		old_initialize(api_key, email, password) 
		@host="http://api.flickr.com" 
		@activity_file='flickr_activity_cache.xml' 
	end 
end

# This initialises the Instagram API. Need to enter Instagram client id and client secret here.
require 'instagram'
Instagram.configure do |config|
	config.client_id = 'enter instagram client id here'
	config.client_secret = 'enter instagram client secret here'
end
