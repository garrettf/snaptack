class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    #params = params.require(:board).permit(:name, :description, :image)
    begin
      geo = Paperclip::Geometry.from_file(params[:board][:image])
    rescue Exception => e
      render 'new'
      return
    end

    # TODO: Complete migration of width/height logic to model.
    # Actually, you should just be able to replace this with params[:board].
    @board = Board.new(:name => params[:board][:name],
                       :description => params[:board][:description],
                       :image => params[:board][:image],
                       :width => geo.width,
                       :height => geo.height)
    if @board.save
      redirect_to @board
    else
      render 'new'
    end
  end

  def show
    @board = Board.find(params[:id])
    @tack = Tack.new
    @photo = Photo.new
    @title = @board.name
  end

end
