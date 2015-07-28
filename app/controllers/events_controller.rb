class EventsController < ApplicationController

def index

end

def new
  @event = Event.new
end

def show
  @event = Event.find(params[:name])
end

# def new
#   @event = Event.create(event:name)
# end

  def create
    e = Event.create(event_params)


    # if @event.save
    #   redirect_to @event
    # else
    #   render 'new'
    # end
  end

  # private

  #   def event_params
  #     params.require(:event).permit(:name, :hashtag))
  #   end
  # end

end
