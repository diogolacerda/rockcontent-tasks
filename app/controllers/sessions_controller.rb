class SessionsController < ApplicationController
  # this controller does not redirect the user to the login page if he's not logged
  skip_before_filter :authenticate_user

  def new
  end

  def create
    user = User.find_by_login params[:login]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] = "Bem-vindo!"
      redirect_to root_path
    else
      flash[:error] = "Usuário não encontrado"
      render "new"
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Até logo"
    redirect_to root_path
  end
end
