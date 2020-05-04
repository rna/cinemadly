class SearchController < ApplicationController

  def search_movie
    @results = OmdbApiClient.new.search_by_title(params[:q])
    if @results["Response"]== "False"
      redirect_to '/users', alert:"Movie not found. Please check spelling"
    else
      redirect_to users_path(:title => @results['Title'], :poster => @results['Poster'])
    end
  end
end
