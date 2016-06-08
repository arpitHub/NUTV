class ProjectController < ApplicationController
	before_action :require_user, only: [:index, :show]
	helper_method :sort_column, :sort_direction
	
  def index
		@projects = Project.order(sort_column + " " + sort_direction)
		@project = Project.new
	  @users = User.role("ep")
		@events = @project.events.new
		@allevents = Event.all
	end
	
	def show
  	@project = Project.find(params[:id])
		@events = @project.events
		@event = @project.events.new
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
		@event = @project.event.new
		respond_with(@project)
	end
	
	def create
		#render :json => params and return
  	@project = Project.new(project_params)
		#puts params.inspect
  	if @project.save
   		redirect_to '/entertainment/projects'
  	else
    	render 'new'
  	end
	end
	
	private
  def project_params
    params.require(:project).permit!
		#(:name, :director, :ep, :equipment, :dates, :status, :event_id, events_attributes: [ :startminute, :endhour, :endminute, :day, :month, :year, :project, :id, :project_id])
	end
	
	private
  def event_params
    params.require(:project).permit(:startminute, :endhour, :endminute, :day, :month, :year, :project)
  end
	
	  private
  
  def sort_column
    Project.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
	
	def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
	
end
