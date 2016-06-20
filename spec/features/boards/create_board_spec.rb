require "rails_helper"

feature 'Create Board' do

  scenario 'Is invalid without Board Name' do
    visit new_board_path
    click_button "Salvar"
    sleep 1
    expect(page).to have_content "Nome não pode ficar em branco"
  end

  scenario 'Should successfully create a board with task' do

    board = build :board
    task = build :task
    priority_type = create :priority_type
    task_status = create :task_status

    visit new_board_path

    # Board
    fill_in "board[name]",  with: board.name
    check "board[is_private]"

    # 1 Task
    fill_in "board[tasks_attributes][0][name]",  with: task.name
    select priority_type.name, from: "board[tasks_attributes][0][priority_type_id]"
    select task_status.name, from: "board[tasks_attributes][0][task_status_id]"

    click_button "Salvar"

    sleep 1

    expect(page).to have_content "Salvo com sucesso"
    expect(Board.last.name).to   eq board.name
    expect(Board.last.is_private).to eq true
    expect(Board.last.tasks.first.name).to eq task.name
    expect(Board.last.tasks.first.priority_type_id).to eq priority_type.id
    expect(Board.last.tasks.first.task_status_id).to eq task_status.id
    expect(current_path).to eq edit_board_path Board.last
  end
end
