class HomeController < ApplicationController

require 'instagram'
require 'foreman'
require 'rest-client'
require 'json'



CALLBACK_URL = "http://localhost:3000/oauth/callback"

# Instagram.configure do |config|
#   config.client_id ="a8d670bb7af0451490579c40b3db0b5e"
#   config.client_secret ="28685ff4bc294b7ea30cf1d60571654b"
#   # For secured endpoints only
#   #config.client_ips = '<Comma separated list of IPs>'
# end


def connect
  redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  puts ENV["CLIENT_ID"]
  puts "hello"
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

 user = User.find_or_create_by(username:username)

 session[:user_id] = user.id
 #render json: user
 redirect_to user_index_path

end

def index


end


end




