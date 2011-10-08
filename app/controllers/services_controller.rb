class ServicesController < ApplicationController
  
  def index
    @services = Service.find_by_user_id(current_user.id)
  end
  
  def new
    @station = Station.find(params[:station_id])
    @services_new = Service.new
    @cheapest = Service.minimum('average_costo_gal')  
  end
  
  def show
    p "<<<<<<<<<<<<<< entre al new <<<<<<<<<<<<<<<<<<<<" + current_user.id.to_s
    @services = Service.find_by_user_id(current_user.id)
    p "xxxxxxxxxxxxxxx services es  xxxxxxxxxxxxx"
    p @services
  end

  def create
    #@services_create = current_user.Service.new(params[:services.id])
    @service_create = Service.new(params[:service])
    @service_create.user_id = current_user.id
    @service_create.station_id = params[:station_id]

    if @service_create.save(@service)
      redirect_to root_path
    else
      redirect_to new_service_path
    end
    
  end
  
end
