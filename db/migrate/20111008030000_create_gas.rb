class CreateGas < ActiveRecord::Migration
  def self.up
    create_table :gas do |t|
      t.integer :station_id
      t.date :Date
      t.float :Coste
      t.float :gal
      t.float :km
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :gas
  end
end
