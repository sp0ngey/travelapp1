class InstagramApiController < ApplicationController
  def instagram_search
  	puts "Searching for #{params["instatags"]}"
	if params["instatags"].nil?
		#render :text => '<h2>Please enter a search string</h2>'
	else
	  	begin
		  	#@instagramPhotos = Instagram.media_popular()
		  	
		  	@instagramPhotos = Instagram.tag_recent_media(params["instatags"], {count: 20}) #60 is the max
		  	render "instagram_display", :collection => @instagramPhotos
	  	end
	end
  end

  def instagram_display
  end
end
