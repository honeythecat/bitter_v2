class TwitsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @twits = Twit.all
  end

  def show
    @twits = Twit.find(params[:id])
  end

  def new
    @twit = Twit.new
  end

  def create
    @twit = Twit.new(twit_params)
    if @twit.save
      flash[:notice] = 'YOU HAVE TWITTED SUCCESSFULLY!'
      redirect_to twits_path(@twit)
    else
      render :new
    end
  end

  private

    def twit_params
      params.require(:twit).permit(:twit)
    end
end
