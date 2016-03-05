class UsersController < ApplicationController
  def login
    login_id = params[:login_id]
    password = params[:password]

    session[:user] = User.authorized_user(login_id, password).first

    redirect_to root_path
  end

  def logout
    session[:user] = nil
    redirect_to root_path
  end
end