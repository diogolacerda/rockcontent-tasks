require "rails_helper"

feature 'Edit Board' do
  let(:board) { create :board, :private }

  background do
    visit edit_board_path board
  end

  scenario 'Is invalid without name' do
    fill_in "board[name]",  with: ""
    click_button "Salvar"
    sleep 1
    expect(page).to have_content "Nome não pode ficar em branco"
  end

  scenario 'Should successfully edit a board' do

    other_board = build :board

    fill_in "board[name]",  with: other_board.name
    uncheck "board[is_private]"
    click_button "Salvar"

    sleep 1

    board.reload
    expect(page).to have_content "Salvo com sucesso"
    expect(board.name).to   eq other_board.name
    expect(board.is_private).to eq false
    expect(current_path).to eq boards_path
  end
end
