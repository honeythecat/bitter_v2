class TwitsController < ApplicationController

  def index
    @twits = Twit.all
  end

  def show
    @twits = Twit.find(params[:id])
  end
  
end
