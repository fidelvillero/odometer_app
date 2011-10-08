class Station < ActiveRecord::Base
  has_many :user
  has_many :services
  
  validates_presence_of :name
  validates_presence_of :address
end
