class VideosController < ApplicationController

  def create
    @video = Video.new(params[:video])
 
    @video.save
    redirect_to @video
  end

  private

  def video_params
    params.require(:video).permit(:title, :length, :format)
  end

end
