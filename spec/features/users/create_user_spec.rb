require "rails_helper"

feature "User - Create" do

  background do
    visit new_session_path
    click_link "Cadastrar"
  end

  scenario "should successfully create a User" do
    user = build :user
    fill_in "user[login]",  with: user.login
    fill_in "user[password]", with: user.password
    fill_in "user[password_confirmation]", with: user.password
    click_button "Salvar"

    sleep 1

    expect(page).to have_content "Bem-vindo!"
    expect(User.last.login).to eq user.login
  end

  scenario "is invalid without login or password" do
    click_button "Salvar"
    sleep 1

    expect(page).to have_content "Login não pode ficar em branco"
    expect(page).to have_content "Senha não pode ficar em branco"

  end

  scenario "is invalid with wrong password_confirmation" do
    user = build :user
    fill_in "user[login]",  with: user.login
    fill_in "user[password]", with: user.password
    fill_in "user[password_confirmation]", with: "other password"
    click_button "Salvar"

    sleep 1
    expect(page).to have_content "Confirmação de Senha não é igual a Senha"
  end

  scenario "is invalid with duplicated login" do
    user = create :user
    fill_in "user[login]",  with: user.login
    fill_in "user[password]", with: user.password
    fill_in "user[password_confirmation]", with: user.password
    click_button "Salvar"

    sleep 1
    expect(page).to have_content "Login já está em uso"
  end


end
