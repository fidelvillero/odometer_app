class Users::ProfilesController < ApplicationController
  before_filter :authenticate_user!
   
    def index
      @user = User.all 
    end
    
    def new
      @user = User.new
    end
    
    def show
      @user_show = current_user
      #minimo coste de gas, de mi consumo
      @cheapest_coste_gas_last_three_month = current_user.services.minimum('average_costo_gal', :conditions => ['Date > ?', '(Time.new + 3.month)'])
      #promedio de coste de gasolina en las estaciones visitadas por mi
      @state_more_visited = current_user.services.average(:costo_gas, :conditions => ['Date > ?', '(Time.new + 3.month)'])
      #@state_more_visited = @user_show.services.maximum('station_id')
      @name_station_more_visited = Station.where(:id => @name_station_more_visited)
      
      
      @car_pertinente = current_user.car
      
      data_table = GoogleVisualr::DataTable.new
      # Add Column Headers
      data_table.new_column('string', 'Date' )
      data_table.new_column('number', 'km/gas')
      
      @user_show.services.each do |service|
        # Add Rows and Values
        data_table.add_rows([
          #fecha vs km/gas 
          [service.Date.to_s, service.average_km_gas],
          #['2005', 1170],
          #['2006', 660],
          #['2007', 1030]
        ])
        option = { width: 400, height: 240, title: 'Odometer Performance' }
        @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option)  
      end
      
    end
    
  
end
