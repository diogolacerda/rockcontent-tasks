require "rails_helper"

feature 'Edit Board' do
  let(:board) { create :board, :private, :with_task }

  scenario 'Is invalid without Board Name' do
    visit edit_board_path board

    fill_in "board[name]",  with: ""
    fill_in "board[tasks_attributes][0][name]",  with: ""
    select "Selecione a Prioridade", from: "board[tasks_attributes][0][priority_type_id]"
    select "Selecione o Status", from: "board[tasks_attributes][0][task_status_id]"
    click_button "Salvar"
    sleep 1
    expect(page).to have_content "Nome não pode ficar em branco"
  end

  scenario 'Should successfully edit a board' do

    other_board = build :board
    other_task = build :task
    priority_type = create :priority_type
    task_status = create :task_status

    visit edit_board_path board

    fill_in "board[name]",  with: other_board.name
    uncheck "board[is_private]"

    fill_in "board[tasks_attributes][0][name]",  with: other_task.name
    select priority_type.name, from: "board[tasks_attributes][0][priority_type_id]"
    select task_status.name, from: "board[tasks_attributes][0][task_status_id]"

    click_button "Salvar"

    sleep 1

    board.reload
    expect(page).to have_content "Salvo com sucesso"
    expect(board.name).to eq other_board.name
    expect(board.is_private).to eq false
    expect(board.tasks.first.name).to eq other_task.name
    expect(board.tasks.first.priority_type_id).to eq priority_type.id
    expect(board.tasks.first.task_status_id).to eq task_status.id
    expect(current_path).to eq edit_board_path board
  end

  scenario 'Should successfully remove a task' do
    visit edit_board_path board

    expect {
      check "board[tasks_attributes][0][_destroy]"
      click_button "Salvar"
      sleep 1
      board.reload
    }.to change(board.tasks, :count).from(1).to(0)
  end
end
