require "rails_helper"

feature "Session" do

  context "Login" do
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

  context "Logout" do
    scenario 'success' do
      user = create(:user)
      login(user.login, user.password)
      logout()
      expect(page).to have_content "Até logo"
    end
  end

end
