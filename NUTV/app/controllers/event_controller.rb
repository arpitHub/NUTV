class EventController < ApplicationController
  def index
    project = Project.find(params[:project_id])
    @events = project.events
   end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def show
    project = Project.find(params[:project_id])
    @event = project.events.find(params[:id])
  end
  
  def new
    project = Project.find(params[:project_id])
    @event = project.events.build
  end
  
def create
    
	end
  
  private
  def event_params
    params.require(:event).permit(:startminute, :endhour, :endminute, :day, :month, :year, :project)
  end

  
end
