class FollowingsController < ApplicationController
  def create
    @followed_id = params[:followed_id]
    follow_request = current_user.followings.new(followed_id: @followed_id)
    if follow_request.save
      flash[:success] = 'Followed the user successfully'
    else
      flash[:error] = 'Error in following'
    end
    redirect_to home_path
  end

  def destroy
    @followed_id = params[:followed_id]
    follow_request = current_user.followings.find_by(followed_id: @followed_id)
    if follow_request.delete
      flash[:success] = 'Unfollowed the user successfully'
    else
      flash[:error] = 'Error in unfollowing'
    end
    redirect_to home_path
  end
end
