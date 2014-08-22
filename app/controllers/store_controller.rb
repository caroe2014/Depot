class StoreController < ApplicationController

  layout "application"
  
  def index
    @products = Product.all
  end
end
