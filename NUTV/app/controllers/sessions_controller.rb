class SessionsController < ApplicationController
  
  def new
    store_referrer_location if session[:return_to].blank?
  end
  
  def create
  session[:return_to] ||= request.referer if request.get?
  @user = User.find_by_email(params[:session][:email])
  if @user && @user.authenticate(params[:session][:password])
    session[:user_id] = @user.id
    redirect_back_or_default root_url
  else
    redirect_to 'login'
  end 
end
  
  def destroy 
    session[:user_id] = nil 
    redirect_to '/' 
  end
  
end
