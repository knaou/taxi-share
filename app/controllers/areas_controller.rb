class AreasController < ApplicationController
  before_filter :check_user

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
    @points = @area.points
    @requirements = Requirement.where(from_area: @area).order('to_area_id ASC')
  end
end
