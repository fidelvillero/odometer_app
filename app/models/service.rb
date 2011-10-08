class Service < ActiveRecord::Base
  validates_presence_of :costo_gas#, :on => :create
  validates_presence_of :cant_gal
  validates_presence_of :kmr
  validates_presence_of :average_km_gas
  validates_presence_of :average_costo_gal
  #validates_numericality_of :costo_gas
  
  has_one :user
  has_one :station
end
