class MainController < ApplicationController
  def index
    flickr = Flickr.new
    if params[:text].nil?
      #render :text => '<h2>Please enter a search string</h2>'
    else
      begin
        # @photos will be a collection of photos returned as a PhotoCollection a subclass
        # of Array
        @photos = flickr.photos(:text => params[:text], :per_page =>'5', :sort => 'relevance')

        #youtube search
        client = Google::APIClient.new(:key => YTkey::GOOGLE_API_KEY, :authorization => nil)
        youtube = client.discovered_api(YTkey::GOOGLE_APP_1, YTkey::GOOGLE_APP_VERSION_1)

        @youtubevideos = client.execute!(:api_method => youtube.search.list, :parameters => {:q => params[:text], :part => 'snippet', :type => 'video', :videoEmbeddable => 'true'})

        render 'main/display'
      end
    end
  end

  def display
  end
end
