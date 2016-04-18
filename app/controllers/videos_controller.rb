class VideosController < ApplicationController

  def new
    @video = Video.new
  end

  def create
    respond_to do |format|
      @video = Video.new(video_params)
   
      if @video.save
        flash[:notice] = 'video saved'
        format.html { redirect_to @video }
        format.js
      else
        format.html { render 'index' }
      end
    end
  end

  def index
    @video = Video.new
    @videos = Video.all.order(created_at: :desc).limit(5)
  end

  def show
    @video = Video.find(params[:id])
  end

  private

  def video_params
    params.require(:video).permit(:attachment, :title, :length, :format)
  end
end
