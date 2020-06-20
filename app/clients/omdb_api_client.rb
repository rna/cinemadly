class OmdbApiClient
  def search_by_title(title)
    search_term = URI.encode_www_form_component(title, enc = nil)
    response = HTTP.get("http://www.omdbapi.com?apikey=#{ENV['OMDB_API_KEY']}&t=#{search_term}")
    JSON.parse(response)
  end
end
