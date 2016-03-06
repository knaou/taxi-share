class RequirementsController < ApplicationController
  before_filter :check_user

  def new
    @areas = Area.all
    @date = DateTime.now
  end

  def show
    @requirement = Requirement.find(params[:id])

  end

  def create
    ActiveRecord::Base.transaction do
      from = Area.find(params[:from])
      to = Area.find(params[:to])
      date = DateTime.parse(params[:date])

      req = Requirement.create(
                           status: 'INITIAL',
                           user: current_user_as_object,
                           from_area: from,
                           to_area: to,
                           from_point: from.points.sample(),
                           to_point: to.points.sample(),
                           date: date
      )

      redirect_to root_path
    end
  end
end