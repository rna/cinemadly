class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:title]
      @title = params[:title]
      @poster = params[:poster]
    end
    @movies = current_user.movies.all
  end

  def show
  end
  
end
