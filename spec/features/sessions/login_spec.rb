require "rails_helper"

feature "Login" do

  scenario 'invalid' do
    login('fulano', 'aaaaa')
    expect(page).to have_content 'Usuário não encontrado'
  end

  scenario 'success' do
    user = create(:user)
    login(user.login, user.password)
    expect(page).to have_content 'Bem-vindo!'
    expect(current_path).to eq root_path
  end
end
