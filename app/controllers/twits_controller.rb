class TwitsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @twits = Twit.all
  end

  def show
    @twit = Twit.find(params[:id])
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

  def edit
    @twit = Twit.find(params[:id])
  end

  def update
    @twit = Twit.find(params[:id])
    if @twit.update(twit_params)
      flash[:notice] = "YOUR TWIT HAS BEEN UPDATED!!"
      redirect_to twit_path
    else
      render :edit
    end
  end

  def destroy
    @twit = Twit.find(params[:id])
    @twit.destroy
    flash[:alert] = "TWIT HAS BEEN DESTROYED!"
    redirect_to twits_path
  end

  private

    def twit_params
      params.require(:twit).permit(:twit)
    end
end
