class BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
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

  private

  def board_params
    params.require(:board).permit(:name, :description, :image)
  end


end
