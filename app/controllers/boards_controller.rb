class BoardsController < ApplicationController

  def index
    current_user
  end

  def new
    @board = Board.new
    @board.tasks.build
  end

  def edit
    @board = Board.find params[:id]
    @board.tasks.build
  end

  def create
    @board = Board.new board_params
    if @board.save
      flash[:info] = "Salvo com sucesso"
      redirect_to edit_board_path @board
    else
      flash[:error] = @board.errors.full_messages.join('<br>')
      render :new
    end
  end

  def update
    @board = Board.find params[:id]
    if @board.update board_params
      flash[:info] = "Salvo com sucesso"
      redirect_to edit_board_path @board
    else
      flash[:error] = @board.errors.full_messages.join('<br>')
      render :edit
    end
  end

  private
  def board_params
    params.require(:board).permit(
      :name,
      :is_private,
      tasks_attributes: [
        :_destroy,
        :id,
        :name,
        :priority_type_id,
        :task_status_id
      ]
    )
  end
end
