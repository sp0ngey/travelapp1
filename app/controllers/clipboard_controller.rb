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
		@newItem.save
	end
	
	def del_image
	  @selItem = ClipboardImage.find(params[:id]);
	  @selItem.destroy

	  redirect_to :action => 'show', :msg => 'Item removed from clipboard...'
	end
end
