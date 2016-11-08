class ProjectController < ApplicationController
	before_action :require_user
	helper_method :sort_column, :sort_direction
	
  def index
		@projects = Project.order(sort_column + " " + sort_direction)
		@project = Project.new
		@allprojects = Project.all
		@events = @project.events.new
	  @users = User.role("ep")
		@allevents = Event.all
	end
	
	def entertainmentindex
		@projects = Project.department("entertainment").order(sort_column + " " + sort_direction)
		@project = Project.new
		@allprojects = Project.all
	  @users = User.role("ep")
		@events = @project.events.new
		@allevents = Event.all
	end

	def sportsindex
		@projects = Project.department("sports").order(sort_column + " " + sort_direction)
		@project = Project.new
		@allprojects = Project.all
	  @users = User.role("ep")
		@events = @project.events.new
		@allevents = Event.all
	end
	
	def newsindex
		@projects = Project.department("news").order(sort_column + " " + sort_direction)
		@project = Project.new
		@allprojects = Project.all
	  @users = User.role("ep")
		@events = @project.events.new
		@allevents = Event.all
	end
	
	def show
  	@project = Project.find(params[:id])
		@events = @project.events
		@event = @project.events.new
		@emailchain = @project.emailchain
	end
	
	def edit
    @project = Project.find(params[:id])
		@users = User.role("ep")
  end
	
	def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
      redirect_to @project
    else
      render 'edit'
    end
  end
	
	def destroy
  	Project.find_by(id: params[:id]).destroy
  	redirect_to :index
	end

	def new
		@project = Project.new
		@users = User.role("ep")
		respond_with(@project)
	end
	
	def create
		@users = User.role("ep")
		#render :json => params and return
  	@project = Project.new(project_params)
		#puts params.inspect
  	if @project.save
   		redirect_to '/projects'
  	else
    	render 'new'
  	end
	end
	
	private
  def project_params
    params.require(:project).permit(:name, :user1, :user2, :notes, :status, :department, :updatedby, :emailchain, events_attributes: [ :starttime, :endtime, :date, :kind, equipment: []])
	end
	
	private
  def event_params
    params.require(:project).permit!
		#(:date, :starttime, :endtime, :kind, :equipment)
  end
	
	  private
  
  def sort_column
    Project.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
	
	def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
	
end
