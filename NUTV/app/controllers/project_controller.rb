class ProjectController < ApplicationController
  def index
		@projects = Project.includes(:events).all
		@project = Project.new
		@events = @project.events.new
	end
	
	def show
  	@project = Project.find(params[:id])
		@events = @project.events
	end
	
	def edit
    @project = Project.find(params[:id])
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
		@event = @project.events.build
	end
	
	def create
		#render :json => params and return
  	@project = Project.new(project_params)
		
		puts params.inspect
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
	
end
