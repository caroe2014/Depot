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
    
    redirect_to(:controller => 'carts', :action => 'show')
  end
  
  def delete
    
    redirect_to line_item_path(params[:id])
  end
    
    
  private
  
    def set_current_cart
      @cart = current_cart
    end
end
