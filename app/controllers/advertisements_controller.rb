class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show

    @advertisement = Advertisement.find(params[:id])
  end

  def new

    @advertisement = Advertisement.new
  end

  def create

    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.body = params[:advertisement][:body]

 # #10
    if @advertisement.save
 # #11
      flash[:notice] = "Post was saved."
      redirect_to @advertisement
    else
 # #12
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end
