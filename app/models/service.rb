class Service < ActiveRecord::Base
  before_create :save_average
  
  def save_average
    self.average_km_gas = self.costo_gas / self.cant_gal
    self.average_costo_gal = self.kmr / self.cant_gal
  end
  
  #validates_numericality_of :only_integer => 
  
  validates_presence_of :costo_gas#, :on => :create
  validates_presence_of :cant_gal
  validates_presence_of :kmr
  validates_presence_of :average_km_gas
  validates_presence_of :average_costo_gal
  #validates_numericality_of :costo_gas
  
  has_one :user
  belongs_to :station
end
