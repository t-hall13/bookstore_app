class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user
  
  def require_signin
    unless current_user
    flash[:warning]= "Please sign in first!"
    #require "pry";binding.pry
    session[:intended_destination] = request.fullpath
    redirect_to signin_path
    end
  end
  
  def require_admin
    unless current_user.admin?
      flash[:danger] = "You have to be an admin to do that!"
      redirect_to root_path
    end
  end
  
  def set_cart
    if session[:cart_id]
      @cart = Cart.find session[:cart_id]
    else
      @cart = Cart.create!
      session[:cart_id] = @cart.id
    end
  end
end
