class AreasController < ApplicationController
  before_filter :check_user

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
    @points = @area.points
    @requirements = Requirement.where('user_id <> ?', current_user_as_object.id).where(from_area: @area).order('to_area_id ASC')
  end
end
