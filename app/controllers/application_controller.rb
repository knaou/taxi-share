class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    session[:user]
  end

  def logined?
    current_user.present?
  end

  def check_user
    if ! logined?
      redirect_to root_path
    end
  end
end

