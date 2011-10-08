class ServicesController < ApplicationController
  
  def new
    @station = Station.find(params[:station_id])
    @services_new = Service.new
    @cheapest = Service.minimum('average_costo_gal')  
  end
  
  def show
    @service = Service.all
    
  end

  def create
    #@services_create = current_user.Service.new(params[:services.id])
    @service_create = Service.new(params[:service])
    @service_create.user_id = current_user.id
    @service_create.station_id = params[:station_id]
    
    kmr = @service_create.kmr
    cant_gasolina = @service_create.cant_gal #cantidad de galones de gasolina
    coste_gas = @service_create.costo_gas
    cant_galones = @service_create.cant_gal
    #coste de gasolina en las diferentes gasolinerias
    
    #operaciones
    
    # kilometros recorridos/ gasolina
    km_gas = kmr / cant_gasolina
    # Costo de gas / galones
    cost_galns = coste_gas / cant_galones
    
    @service_create.average_km_gas = km_gas
    @service_create.average_costo_gal = cost_galns
    
    p "<<<<<< kmr / cant_gasolina " + km_gas.to_s
    p "<<<<<< coste_gas / cant_galones " + cost_galns.to_s
     
    
    if @service_create.save(@service)
      redirect_to "/stations/#{:station_id}/services/#{:id}", :notice => 'creo q se guardo..!'
    else
      redirect_to(render :action => "new")
    end
    
  end
  
end
