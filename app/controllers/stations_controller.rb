class StationsController < ApplicationController
  
  #before_filter :authenticate_user!
  
  def index
    @stations = Station.all
    chart
  end
  
  def chart
    data_table = GoogleVisualr::DataTable.new
    # Add Column Headers
    data_table.new_column('string', 'Date' )
    data_table.new_column('number', 'km/gas')
    
    @stations.each do |station|
      station.services do |service|
        # Add Rows and Values
        data_table.add_rows([
          #fecha vs km/gas 
          #[station.services.Date.to_s, station.services.average_km_gas],
          [service.Date.to_s, service.average_km_gas],
        ])
        option = { width: 400, height: 240, title: 'Odometer Performance' }
        @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option) 
      end 
    end
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
    p "show "*100
    @station = Station.find(params[:id])
    @services = @station.services
  end
  
  def destroy
    @station = Statio.find(params[:id])
    @services = @station.services.find(params[:id])
    p @station
    @services.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
    
end
