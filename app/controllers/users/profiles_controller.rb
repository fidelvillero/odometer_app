class Users::ProfilesController < ApplicationController
  before_filter :authenticate_user!
   
    def index
      @user = User.all 
    end
    
    def new
      @user = User.new
    end
    
    def id_and_name_state_mora_vited(hash_state_current, hash_ids_station_distinct)
      p "fidel"*100
      p @count_state_mas_frecuentada = hash_state_current[1]
      hash_ids_station_distinct.each do |ids|
        if hash_state_current[ids.station_id] > @count_state_mas_frecuentada
          p "la estacion con state_id " + ids.station_id.to_s + " es mayor"
          @station = Station.find_by_id(ids.station_id)
          @id_station = ids.station_id
          @count_state_mas_frecuentada = hash_state_current[ids.station_id]
          p @count_state_mas_frecuentada
        end
      end
    end
    
    def show
      @user_show = current_user
      @car_pertinente = current_user.car

      p "todas las station_id" + "<"*100
      #grupo de estaciones frecuentadas por mi
      @station_concurrente = @user_show.services.count(:station_id, :group => :station_id)
      @station_concurrente
      @hash_ids_station_distinct = @user_show.services.select('DISTINCT station_id')
  
      
      id_and_name_state_mora_vited(@station_concurrente, @hash_ids_station_distinct)
      
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
