class EventsController < ApplicationController
	before_action :require_user
	
  def index
    project = Project.find(params[:project_id])
    @events = project.events
   end
  
  def edit
    @project = Project.find(params[:project_id])
    @event = @project.events.find(params[:id])
  end
  
  def show
    @project = Project.find(params[:project_id])
    @event = @project.events.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to :event
    else
      render 'edit'
    end
  end
  
  def new
    @project = Project.find(params[:project_id])
    @event = @project.events.build(event_params)
		redirect_to @project
  end

  def create
    @project = Project.find(params[:project_id])
    @event = @project.events.build(event_params)
    if @event.save
   		redirect_to @project
  	else
    	render 'new'
  	end
  end

  def destroy
		@project = Project.find(params[:project_id])
    @project.events.find(params[:id]).destroy
  	redirect_to @project
	end
  
  private
  def event_params
    params.require(:event).permit(:kind, :date, :starttime, :endtime, equipment: [])
  end

  
end
