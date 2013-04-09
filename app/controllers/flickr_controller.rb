class FlickrController < ApplicationController
	def flickrsearch
		flickr = Flickr.new
		if params[:text].nil?
			#render :text => '<h2>Please enter a search string</h2>'
		else
			begin
				@photos = flickr.photos(:text => params[:text], :per_page =>'10', :sort => 'relevance')
				render "display", :collection => @photos
			end
		end
	end

	def display

  	end
end
