class FlickrController < ApplicationController
	def flickrsearch
		flickr = Flickr.new
		if params[:tags].nil?
			#render :text => '<h2>Please enter a search string</h2>'
		else
			begin
				@photos = flickr.photos(:tags => params[:tags], :per_page =>'10')
				render "display", :collection => @photos
			end
		end
	end

	def display

  	end
end
