class YoutubeController < ApplicationController
  def search
    #require 'google/api_client'

    if params[:text].nil?
      #render :text => '<h2>Please enter a search string</h2>'
    else
      begin
        client = Google::APIClient.new(:key => YTkey::GOOGLE_API_KEY, :authorization => nil)
        youtube = client.discovered_api(YTkey::GOOGLE_APP_1, YTkey::GOOGLE_APP_VERSION_1)

        @ytresult = client.execute!(:api_method => youtube.search.list, :parameters => {:q => params[:text], :part => 'snippet', :type => 'video', :videoEmbeddable => 'true'})
        render 'youtube/display'
      end
    end
  end

  def display
  end
end
