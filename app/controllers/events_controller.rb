class EventsController < ApplicationController

def index

end

def new
  @event = Event.new
end

def show
  @event = Event.find(params[:id])

 query = @event.hashtag

 response = RestClient.get 'https://api.instagram.com/v1/tags/' + query + '/media/recent?access_token=' + ENV['ACCESS_TOKEN']
    @tags = JSON.parse(response)["data"]


end


def create
  e = Event.create(event_params)

end

def destroy

    @event = Event.find(params[:id])
    @event.destroy
    redirect_to(user_index_path)

  end


end
