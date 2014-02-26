require 'instagram'
require 'httparty'


class SearchesController < ApplicationController

  

  def index
  	@instagram_results = nil
  end

  def subscribe
    client = Instagram.client(:access_token => session[:access_token])
    #@user = client.user
    @subscription = client.create_subscription("tag","http://19d6fa9d.ngrok.com/subs", aspect='media',{object_id: "#dog"} )
    @subs = Instagram.subscriptions
    render 'subs/index'
  end


  def create
    




    # Curl.post("-F 'client_id=681ce687a0af4694826889d1daa47ce7' \
    #  -F 'client_secret=47b7ff47649e4b248f9dd10d7bd0b000' \
    #  -F 'object=user' \
    #  -F 'aspect=media' \
    #  -F 'verify_token=myVerifyToken' \
    #  -F 'callback_url=http://7a0fa841.ngrok.com' \
    #  https://api.instagram.com/v1/subscriptions/")
	if session[:access_token]
		client = Instagram.client(:access_token => session[:access_token])
    @user = client.user
    
    @instagram_results = client.tag_recent_media(params[:search])
	else
		@instagram_results = Instagram.tag_recent_media(params[:search])
	end
	# need to redirect to search results page
	# redirect_to searches_path
  end



end
