class Users::ProfilesController < ApplicationController
  before_filter :authenticate_user!
  
  
  #
  
  
    def index
      @user = User.all 
    end
    
    def new
      @user = User.new
    end
    
    def show
      @user_show = current_user
      @car_pertinente = current_user.car
      # xxxxxxxxxxxxxxxxxxxxxxxxx 
      data_table = GoogleVisualr::DataTable.new
      # Add Column Headers
      data_table.new_column('string', 'Year' )
      data_table.new_column('number', 'Sales')
      data_table.new_column('number', 'Expenses')

      # Add Rows and Values
      data_table.add_rows([
        ['2004', 1000, 400],
        ['2005', 1170, 460],
        ['2006', 660, 1120],
        ['2007', 1030, 540]
      ])
      
      option = { width: 400, height: 240, title: 'Company Performance' }
      @chart = GoogleVisualr::Interactive::AreaChart.new(data_table, option)

      
    end
    
    def ffff    
      data_table = GoogleVisualr::DataTable.new
      # Agregar encabezados de columna
      data_table.new_column("cadena", "Ano")
      data_table.new_column("numero", "Ventas")
      data_table.new_column("numero", "Gastos")

      # Agregar filas y Valores
      data_table.add_rows ([
        ['2004 ', 1000, 400],
        ['2005 ', 1170, 460],
        ['2006 ', 660, 1120],
        ['2007 ', 1030, 540]
      ])
      #debugger
      option = {width: 400, altura: 240, title: 'resultados de la empresa'}
      @Tabla = GoogleVisualr::Interactive::AreaChart.new(data_table, option)
      p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>", @Tabla
    end
  
end
