class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:title]
      @title = params[:title]
      @poster = params[:poster]
    end
    timeline_movies
    @non_followings = current_user.non_following.ordered_by_most_recent
  end

  def show
    @user = User.find(params[:id])
    @timeline_movies = @user.movies.all
    @followings = @user.following_users
  end

  private

  def timeline_movies
    ids = current_user.followings.pluck(:followed_id) << current_user.id
    @timeline_movies ||= Movie.where(user_id: ids).ordered_by_most_recent.uniq(&:title)
  end
end
