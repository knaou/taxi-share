class AreasController < ApplicationController
  before_filter :check_user

  def index
    @areas = Area.all
  end

  def show
    @area = Area.find(params[:id])
    @points = @area.points
  end
end
