class Gas < ActiveRecord::Base
  has_many :users
  belongs_to :station
end
