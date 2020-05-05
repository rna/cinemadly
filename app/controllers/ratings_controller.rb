class RatingsController < ApplicationController
  def create
    @rating = current_user.ratings.new(rating_params)
    if @rating.save
      flash[:success] = "You rated the movie"
    else
      flash[:error] = "You already rated this movie"
    end
    redirect_to home_path
  end

  private

  def rating_params
    params.require(:rating).permit(:rating,:movie_id)
  end

end
