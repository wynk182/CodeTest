class UsersController < ApplicationController

  # get /users
  def index
    @users = User.all
    # render json: @users.map {|u| {id: u.id, name: u.name, email: u.email}}
  end

  # post /users
  def admin_search
    min = '0'
    max = '200'
    unless params[:search].to_s.empty?
      case
        when params[:search].include?('+')
          min = params[:search].gsub('+', '')
        when params[:search].include?('-')
          range = params[:search].split('-')
          if range.length > 1
            max = range[1]
            min = range[0]
          else
            max = range[0]
          end
        else
          min = max = params[:search].to_i
      end
    end
    p min
    p max
    @users = User.where(:age => min..max)

    # respond_to do |format|
    #   format.js
    @search_results = @users.map {|u| {id: u.id, name: u.name, email: u.email}}.to_json
    #   format.html
    # end
  end

end