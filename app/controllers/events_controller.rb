class EventsController < ApplicationController

def index

end

def new
  @event = Event.new
end

def show
  @event = Event.find(params[:name])
end


  def create
    e = Event.create(event_params)

  end


end
