class AssignmentsController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      req = Requirement.find(params[:requirement_id])
      ass = Assignment.create(requirement: req, user: current_user_as_object)

      redirect_to assignment_path(ass)
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      ass = Assignment.find(params[:id])
      if ass.user != current_user_as_object
        raise 'cannot destroy'
      end

      ass.destroy
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
  end
end