require "rails_helper"

feature 'Create Board' do

  background do
    visit boards_path
    click_link "Novo Board"
  end

  scenario 'Is invalid without name' do

    click_button "Salvar"
    sleep 1
    expect(page).to have_content "Nome não pode ficar em branco"
  end

  scenario 'Should successfully create a board' do

    board = build :board

    fill_in "board[name]",  with: board.name
    check "board[is_private]"
    click_button "Salvar"

    sleep 1

    expect(page).to have_content "Salvo com sucesso"
    expect(Board.last.name).to   eq board.name
    expect(Board.last.is_private).to eq true
    expect(current_path).to eq boards_path
  end
end
