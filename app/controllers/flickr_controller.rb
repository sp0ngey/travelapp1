class FlickrController < ApplicationController
	def flickrsearch
		flickr = Flickr.new
		if params[:text].nil?
			#render :text => '<h2>Please enter a search string</h2>'
		else
			begin
				# @photos will be a collection of photos returned as a PhotoCollection a subclass
				# of Array
				#
				@photos = flickr.photos(:text => params[:text], :per_page =>'10', :sort => 'relevance')
				render 'flickr/display'
			end
		end
	end

	def display

  	end
end
