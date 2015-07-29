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
    result = Event.destroy params[:id]
    # redirect_to :tasks
    respond_to do |format|
      format.html {redirect_to :user}
      format.json {render json: result}
    end
  end


end
