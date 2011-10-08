class Station < ActiveRecord::Base
  has_many :user
  has_many :entry
end
