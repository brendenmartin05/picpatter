class UserController < ApplicationController
  require 'rest-client'

  def new

  end

  def index
    # @tag = Tag.new()
    @query = params[:q]
    @username = @current_user


 end

 def show
  @query = params[:q]

  # render json: params

  # if @query
  #   response = RestClient.get 'https://api.instagram.com/v1/tags/{tag-name}?access_token=ACCESS-TOKEN', {:params => {:term => @query}}
  #   render jason: params
# end


 # @search = Search.find(params[:id])
 # @tag_count =
 #  instagram_tag_stat(@search.hashtag).to_s.
 #  reverse.gsub(/…(?=.)/,’\&,’).reverse
 # @pics_info = instagram_photos(@search.hashtag)


end
end

