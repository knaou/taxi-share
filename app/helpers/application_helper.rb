module ApplicationHelper
  def current_user
    session[:user]
  end

  def logined?
    current_user.present?
  end

  def localize_status(status)
    case status
      when 'INITIAL'
        'まだ許可されていません'
      when 'APPROVED'
        '許可されました'
      when 'DECLINE'
        '取り下げられました'
    end
  end
end
