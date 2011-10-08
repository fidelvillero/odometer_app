class StationsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @stations = Station.all
  end
  
  def new
    @station = Station.new
  end
  
  def create
    @station = Station.new(params[:station])
    if @station.save
      redirect_to(@station, :notice => "la estacion fue creada..!")
    else
      render :action => "new"
    end
  end
  
  def show
    @station = Station.find(params[:id])
  end
end
