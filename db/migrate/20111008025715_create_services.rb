class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.integer :station_id
      t.integer :user_id
      t.date :Date
      t.float :costo_gas
      t.float :cant_gal
      t.float :kmr #kilometros recorridos
      t.float :average_km_gas
      t.float :average_costo_gal
      #t.float :average_costo_dif_gas #diferentes gasolineras
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
