class UserController < ApplicationController
  require 'rest-client'
  require 'json'

  def new

  end

def index
  @query = params[:q]
  @events = @current_user.events
  @profile_picture = @current_user.profile_picture





end


def show
  @query = params[:q]
  @event_name = params[:event]


  @event = Event.create(name: @event_name, hashtag: @query, user_id: @current_user.id)

  # p @event_name

  if @query
    response = RestClient.get 'https://api.instagram.com/v1/tags/' + @query + '/media/recent?access_token=' + session[:access_token]
    @tags = JSON.parse(response)["data"]


  end

 end
end


