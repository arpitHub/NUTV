class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def require_user 
    redirect_to '/login' unless current_user 
  end
  
  def require_eboard
    redirect_to '/' unless current_user.eboard?
  end

  def require_director
    redirect_to '/' unless current_user.director?
  end  
  
  def require_ep
    redirect_to '/' unless current_user.ep 
  end
  
  def store_referrer_location
    session[:return_to] = request.referrer
  end

end
