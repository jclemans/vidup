class VideosController < ApplicationController
  def new
  end

  def create
    @video = Video.new(params[:video])
 
    @video.save
    redirect_to @video
  end

  def index
    @videos = Video.all.limit(5)
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def video_params
    params.require(:video).permit(:attachment, :title, :length, :format)
  end
end
