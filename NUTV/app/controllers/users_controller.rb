class UsersController < ApplicationController
  
  def new
    @user = User.new
		store_referrer_location if session[:return_to].blank?
  end
  
  def index 
    @users = User.all
  end
  
  def create
  session[:return_to] ||= request.referer if request.get?
  @user = User.new(user_params) 
  if @user.save
    session[:user_id] = @user.id
    redirect_back_or_default root_url
  else 
    redirect_to '/signup'
  end 
end
  
  def show
  	@user = User.find(params[:id])
    @projects = Project.user1(@user.id)
	end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end
  
end
