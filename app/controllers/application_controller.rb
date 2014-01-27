class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :date_loaded

private
  def date_loaded
    return Time.now
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
