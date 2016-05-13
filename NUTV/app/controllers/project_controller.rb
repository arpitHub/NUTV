class ProjectController < ApplicationController
  def index
		@projects = Project.all
		@project = Project.new
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

	def create 
  	@project = Project.new(project_params) 
  	if @project.save 
   		redirect_to '/entertainment/projects' 
  	else 
    	render 'new'
  	end
	end
	
	private 
  def project_params 
    params.require(:project).permit(:name, :director, :ep, :equipment, :dates, :status) 
  end
end
