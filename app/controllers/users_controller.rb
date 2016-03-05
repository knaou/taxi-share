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

  def new
  end

  def create
    name = params[:name]
    login_id = params[:login_id]
    password = params[:password]

    if User.authorized_user(login_id, password).present?
      redirect_to new_user_path
    else
      session[:user] = User.create(name: name, login_id: login_id, password: password)
      redirect_to root_path
    end
  end
end