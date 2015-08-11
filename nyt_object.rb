require_relative "./key.rb"
require 'rest-client'
require 'pry'

nytimes_today_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20150811&end_date=20150811&hl=true&api-key=#{NYT}")
today_parsed = JSON.parse(nytimes_today_json)

# nytimes_20140811_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20140811&end_date=20150811&hl=true&api-key=$NYT")
# 20140811_parsed = JSON.parse(nytimes_20140811_json)
#
# nytimes_20040811_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20040811&end_date=20150811&hl=true&api-key=$NYT")
# 20040811_parsed = JSON.parse(nytimes_20040811_json)

class Nytimes
  attr_reader :story_headline, :story_link

  def initialize(array)
    @story_headline = story_headline
    @story_link = story_link
  end

  def get_nyt_headline(today_parsed)
    today_docs_array = today_parsed["response"]["docs"]
    today_headlines_array = today_docs_array.collect {|doc| doc["headline"]["main"]}
  end
end
