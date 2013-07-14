class MainController < ApplicationController
  def index

    @users = User.all

    flickr = Flickr.new
    respond_to do |format|
      if params[:text].blank?

        flash.now[:notice] = 'Please enter a search string' if params[:searching]
        format.html{ render :action => 'index'}
      else
        begin

            user = User.find(params[:app_user][:user_id])
            current_user(user)
            @current_user_trips = Trip.where(:user_id => @current_user.id)
            @current_trip_items = TripItem.all    #TODO need to query trip items from a selected trip. Maybe we can leave this til Jquery

          #@current_user = User.where(:id => @current_id).pluck(:first_name).to_s
          # @photos will be a collection of photos returned as a PhotoCollection subclass
          # of Array
          @photos = flickr.photos(:text => params[:text], :per_page =>'5', :sort => 'relevance')

          #youtube search
          client = Google::APIClient.new(:key => YTkey::GOOGLE_API_KEY, :authorization => nil)
          youtube = client.discovered_api(YTkey::GOOGLE_APP_1, YTkey::GOOGLE_APP_VERSION_1)

          @youtubevideos = client.execute!(:api_method => youtube.search.list, :parameters => {:q => params[:text], :part => 'snippet', :type => 'video', :videoEmbeddable => 'true'})

          format.html{render :action => 'display'}
          #render 'main/display'
        end
      end
    end
  end

  def display

  end
end

def full_name
  "#{first_name} #{last_name}"
end

def current_user(user)
  @current_user = user
end

def trip_name
  "#{trip_name}"
end

def trip_item_name
  "#{name}"
end

def ajax_msg
  @msg1 = "Buenos Dias!"
  puts 'tst'
  respond_to do |format|
    format.html {redirect_to main_ajax_msg_url }
    format.js {@msg1}
    format.json { render json: @msg1}
  end
end