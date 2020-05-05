class MoviesController < ApplicationController

  def create
    @movie = current_user.movies.new(movie_params)
    if @movie.save
      flash[:success] = "Movie added to library"
    else
      flash[:error] = "Movie already available in Library"
    end
    redirect_to home_path
  end


  private

  def movie_params
    params.require(:movie).permit(:title, :poster)
  end
end
