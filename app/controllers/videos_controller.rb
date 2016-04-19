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
        flash[:notice] = 'Error messages: ' + @video.errors.full_messages.join(', ')
        format.html { render 'index' }
      end
    end
  end

  def index
    @video = Video.new
    @videos = Video.all.order(created_at: :desc).page params[:page]
  end

  def show
    @video = Video.find(params[:id])
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(video_params)
      redirect_to videos_path, notice: "Video was successfully updated."
    else
      render :edit
    end
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
