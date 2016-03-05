module ApplicationHelper
  def current_user
    session[:user]
  end

  def logined?
    current_user.present?
  end
end
