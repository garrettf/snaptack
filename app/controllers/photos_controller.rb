class PhotosController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        @tack = Tack.find(params[:tack_id])
        output = []
        @tack.photos.order("created_at desc").each do |photo|
          output << {:id => photo.id,
                     :title => photo.title,
                     :description => photo.description,
                     :url => view_context.image_path(photo.image.url(:medium)) }
        end
        render :json => output.to_json
      end
    end
  end

  def create
    @tack = Tack.find(params[:tack_id])
    # TODO Check ownership of board.
    @photo = @tack.photos.build(photo_params)
    if @photo.save
      redirect_to @tack.board
    else
      # TODO proper redirect
      redirect_to @tack.board
    end
  end

  def show
    #@tack = Tack.find(params[:id])
    #respond_to do |format|
      #format.json { render :json => @tack.to_json }
    #end
  end

  private

  def photo_params
    params.require(:tack_id)
    params.require(:photo).permit(:title, :description, :number, :image)
  end
  
end

