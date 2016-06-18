class BoardsController < ApplicationController

  def index
    current_user
  end

  def new
    @board = Board.new
  end

  def edit
    @board = Board.find params[:id]
  end

  def create
    @board = Board.new board_params
    if @board.save
      flash[:info] = "Salvo com sucesso"
      redirect_to boards_path
    else
      flash[:error] = @board.errors.full_messages.join('<br>')
      render :new
    end
  end

  def update
    @board = Board.find params[:id]
    if @board.update board_params
      flash[:info] = "Salvo com sucesso"
      redirect_to boards_path
    else
      flash[:error] = @board.errors.full_messages.join('<br>')
      render :edit
    end
  end

  private
  def board_params
    params.require(:board).permit(:name, :is_private)
  end
end
