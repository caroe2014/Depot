class StoreController < ApplicationController
  before_action :set_current_cart
  
  layout "application"
  
  def index
    if session[:counter].nil?
      @counter = 0
    else
      @counter = 1 + session[:counter]   
    end
    session[:counter] = @counter
    
    @products = Product.all
    set_current_cart
  end
  
  def show   
  end
  
  private
  
    def set_current_cart
      @cart = current_cart
    end
end
