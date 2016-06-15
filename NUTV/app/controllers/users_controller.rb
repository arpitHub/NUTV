class UsersController < ApplicationController
  before_action :require_user
	
  def new
    @user = User.new
		store_referrer_location if session[:return_to].blank?
  end
  
  def index
		redirect_to'/' unless current_user.eboard?
    @users = User.all
  end
  
  def create
  session[:return_to] ||= request.referer if request.get?
  @user = User.new(user_params)
  if @user.save
		UserMailer.sample_email(@user).deliver
    session[:user_id] = @user.id
    redirect_back_or_default root_url
  else 
    redirect_to '/signup'
  end 
end
  
  def show
  	@user = User.find(params[:id])
    @projects = Project.user1(@user.id)
		@projectson = Project.user2(@user.id)
		#|| Project.emailchain.to_sentence.include?(@user.id)
	end
  
	def edit
    @user = User.find(params[:id])
  end
	
	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
	
	def destroy
  	User.find_by(id: params[:id]).destroy
		session[:user_id] = nil
  	redirect_to '/home'
	end
	
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end
  
end
