class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :car_attributes, :full_name, :email, :password, :password_confirmation, :remember_me

  has_one :car
  has_many :services

  accepts_nested_attributes_for :car

  validates_associated :car
  validates_presence_of :full_name
  validates_presence_of :make
  validates_presence_of :model
  validates_presence_of :initial_odometer
  #validates_numericality_of :initial_odometer, :only_integer
  validates_presence_of :make
end
