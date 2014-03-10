class TacksController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    # TODO Check ownership of board.
    @tack = @board.tacks.build(tack_params)
    if @tack.save
      redirect_to @board
    else
      # TODO proper redirect
      redirect_to @board
    end
  end

  def show
    @tack = Tack.find(params[:id])
    respond_to do |format|
      format.json { render :json => @tack.to_json }
    end
  end

  private

  def tack_params
    params.require(:board_id)
    params.require(:tack).permit(:name, :description, :top, :left)
  end

end

