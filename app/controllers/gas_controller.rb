class GasController < ApplicationController
  def new
     @gas_new = Gas.new
   end
end
