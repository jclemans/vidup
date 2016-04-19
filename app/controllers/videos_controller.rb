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
    @videos = Video.all.order(created_at: :desc)
  end

  def show
    @video = Video.find(params[:id])
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_path, notice: "Video '#{@video.title}' deleted."
  end

  private

  def video_params
    params.require(:video).permit(:attachment, :title, :length, :format)
  end
end
