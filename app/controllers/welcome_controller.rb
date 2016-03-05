class WelcomeController < ApplicationController
  def show
    if logined?
      render 'show_logined'
    else
      render 'show_not_logined'
    end
  end
end