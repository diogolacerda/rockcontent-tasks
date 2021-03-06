class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:info] = "Bem-vindo!"
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages.join('<br>')
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :login,
      :password,
      :password_confirmation
    )
  end
end
