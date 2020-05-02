class SearchController < ApplicationController
  

  def search_movie
    @results = OmdbApiClient.new.search_by_title(params[:q])
    if @results["Response"]== "False"
      # session
      redirect_to users_url, alert:"Movie not found. Please check spelling"
    else
      redirect_to users_url
    end
  end
end
