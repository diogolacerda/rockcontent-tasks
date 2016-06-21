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

  scenario "should successfully change the task status", js: true do
    to_do = create :task_status, name: "To-do"
    in_progress = create :task_status, name: "In Progress"
    public_board = create :board

    to_do_task = create :task, name: "To-do Task", board: public_board, task_status: to_do
    in_progress_task = create :task, name: "In Progress Task", board: public_board, task_status: in_progress

    visit boards_path

    within("ul#to_do_#{public_board.id}") do
      expect(page).to have_content to_do_task.name
      expect(page).not_to have_content in_progress_task.name
    end
    sleep 1

    select "In Progress", from: "task_status_#{to_do_task.id}"

    sleep 1

    select "To-do", from: "task_status_#{in_progress_task.id}"

    sleep 1
    within("ul#to_do_#{public_board.id}") do
      expect(page).not_to have_content to_do_task.name
      expect(page).to have_content in_progress_task.name
    end

    within("ul#in_progress_#{public_board.id}") do
      expect(page).to have_content to_do_task.name
      expect(page).not_to have_content in_progress_task.name
    end

  end
end
