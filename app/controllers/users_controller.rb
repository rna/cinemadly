class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:title]
      @title = params[:title]
      @poster = params[:poster]
    end
    @movies = current_user.movies.all
    @non_followings = current_user.non_following
  end

  def show
  end

end
