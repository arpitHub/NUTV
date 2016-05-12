class ProjectController < ApplicationController
  def index
		@projects = Project.all
		@project = Project.new
	end
	
	def show
  	@project = Project.find(params[:id])
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
