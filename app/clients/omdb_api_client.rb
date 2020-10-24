class OmdbApiClient
  def search_by_title(title)
    response = HTTP.get("http://www.omdbapi.com?apikey=#{ENV['OMDB_API_KEY']}&t=#{title}")
    JSON.parse(response)
  end
end
