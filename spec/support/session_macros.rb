module SessionMacros
  def login(user_login, user_pass)
    visit new_session_path
    fill_in 'login', with: user_login
    fill_in "password",  with: user_pass
    click_button "Entrar"
    sleep 1
  end

  def logout
    click_link "Sair"
  end
end
