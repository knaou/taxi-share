class WelcomeController < ApplicationController
  def show
    if logined?
      show_with_user
    else
      render 'show_not_logined'
    end
  end

  def show_with_user
    @assignments = Assignment.where(user: current_user_as_object)
    @requirements = Requirement.where(user: current_user_as_object)

    render 'show_logined'
  end
end