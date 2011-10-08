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
      @car_pertinente = current_user.car
      
      data_table = GoogleVisualr::DataTable.new
      # Add Column Headers
      data_table.new_column('string', 'Year' )
      data_table.new_column('number', 'Sales')
      
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
