class UserController < ApplicationController
  require 'rest-client'
  require 'json'

  def new

  end

def index
  @query = params[:q]
  @current_user
  @events = @current_user.events



end


def show
  @query = params[:q]
  @event_name = params[:event]

  @event = Event.create(name: @event_name, hashtag: @query, user_id: @current_user.id)

  p @event_name

  if @query
    response = RestClient.get 'https://api.instagram.com/v1/tags/' + @query + '/media/recent?access_token=' + ENV['ACCESS_TOKEN']
    @tags = JSON.parse(response)["data"]

    # @event=Event.find(event_params)

  end

 end

 # private

 #    def event_params
 #      params.require(:event).permit(:name, :hashtag)
 #    end



end


