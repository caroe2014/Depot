class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' } 

  private
 
    def current_cart
       
      cart = Cart.find(session[:cart_id])
      puts " ***** Cart Creado por via normal *****"
      cart
    rescue ActiveRecord::RecordNotFound
        puts ">>>> Cart Creado Por excepcion <<<<"
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
    puts "#### end on current Cart #####"
end
