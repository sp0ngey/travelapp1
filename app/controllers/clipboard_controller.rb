class ClipboardController < ApplicationController
	def show
		@cbItems = ClipboardImage.all #TODO update to find()
		@userName = "Some one"
		@msg = "";

# So why is this in the example scaffold?!
#		respond_to do |format|
#			format.html # show.html.erb
#		end
	end
	
	def add_image
		@newItem = ClipboardImage.new()
		@newItem.url = params[:img_url]
    @newItem.source = params[:source]

    respond_to do |format|
      if @newItem.save
        format.html { redirect_to root_path }
        #format.js
        format.json { render json: @newItem, status: :created, location: @newItem }
        MediaItem.create(:clipboard_image_id => @newItem.id, :trip_item_id => 6)   #TODO need to assign trip_item_id properly via drop down. Maybe start playing with AJAX?
      end
    end


	end
	
	def del_image
	  @selItem = ClipboardImage.find(params[:id]);
	  @selItem.destroy

	  redirect_to :action => 'show', :msg => 'Item removed from clipboard...'
	end
end
