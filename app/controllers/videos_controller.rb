class VideosController < ApplicationController
  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
 
    @video.save
    redirect_to @video
  end

  def index
    @video = Video.new
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
