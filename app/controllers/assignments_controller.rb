class AssignmentsController < ApplicationController
  before_filter :check_user

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

  def reply
    ActiveRecord::Base.transaction do
      ass = Assignment.find(params[:id])
      type = params[:type]
      raise "Unexpected" if ass.nil? || ass.requirement.user != current_user_as_object
      s = case type
            when 'APPROVE'
              'APPROVED'
            when 'DECLINE'
              'DECLINED'
            else
              raise "Unexpected"
          end
      ass.status = s
      ass.save!
    end

    redirect_to root_path
  end

  def show
    @assignment = Assignment.find(params[:id])
  end
end