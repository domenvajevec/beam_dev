require 'instagram'

class SubsController < ApplicationController
  respond_to :json
  def index
    @token = params["hub.challenge"]
    logger.info ("#{@token}")
    
    
  end
  
end
