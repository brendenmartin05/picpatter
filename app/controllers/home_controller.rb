class HomeController < ApplicationController

require 'instagram'
require 'foreman'
require 'rest-client'
require 'json'



CALLBACK_URL = "http://localhost:3000/oauth/callback"

def connect
  redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  puts ENV["CLIENT_ID"]

end


def callback
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token

  # render json: params
  # render plain: params['code']
  # @user =User.create(username: params['code'])
  # @user =Instagram.code

  # redirect_to user_index_path

 client = Instagram.client(:access_token => session[:access_token])
 username = client.user.username
 profile_picture = client.user.profile_picture



 user = User.find_or_create_by(username:username,profile_picture:profile_picture)

 session[:user_id] = user.id
 #render json: user
 redirect_to user_index_path

end

def index


end


end




