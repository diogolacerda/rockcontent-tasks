require "rails_helper"

feature "Board Index" do

  scenario "Not logged users cannot see private boards" do

    public_board = create :board
    private_board = create :board, :private

    visit boards_path

    expect(page).to have_content public_board.name
    expect(page).not_to have_content private_board.name

  end

  scenario "Logged users sees private and public boards" do
    public_board = create :board, :with_task
    private_board = create :board, :private, :with_task
    user = create :user

    login(user.login, user.password)

    visit boards_path

    expect(page).to have_content public_board.name
    expect(page).to have_content private_board.name
  end
end
