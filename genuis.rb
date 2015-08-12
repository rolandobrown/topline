# require 'net/http'
require_relative "./key.rb"
require 'json'
require 'rest-client'
require 'pry'
# require 'oauth2'

code

today_docs_array = today_parsed["response"]["docs"]
today_headlines_array = today_docs_array.collect {|doc| doc["headline"]["main"]}

# binding.pry

#setup a ruby files that prints out what would you like to set for, gets.chomp, takes in something else, and then creates a new nytimes object from that user input.


# https://api.genius.com/oauth/authorize?
# client_id="#{GENIUSID}"&
# redirect_uri='http://georgetoothman.info'&
# scope='me'&
# state=SOME_STATE_VALUE&
# response_type=code
#
#
# https://http://georgetoothman.info/#access_token=ACCESS_TOKEN&state=STATE
#
#
# client = OAuth2::Client.new("#{GENIUSID}", "#{GENIUSSecret}", :site => 'http://georgetoothman.info')
#
# client.auth_code.authorize_url(:redirect_uri => 'http://flatironschool.com')
# # => "https://example.org/oauth/authorization?response_type=code&client_id=client_id&redirect_uri=http://localhost:8080/oauth2/callback"
#
# token = client.auth_code.get_token("#{GENIUSAccess}", :redirect_uri => 'http://flatironschool.com', :headers => {'Authorization' => "1234"})
# # response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })
# response.class.name

# nytimes_today_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20150811&end_date=20150811&hl=true&api-key=#{NYT}")
# today_parsed = JSON.parse(nytimes_today_json)

# nytimes_20140811_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20140811&end_date=20150811&hl=true&api-key=$NYT")
# 20140811_parsed = JSON.parse(nytimes_20140811_json)
#
# nytimes_20040811_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20040811&end_date=20150811&hl=true&api-key=$NYT")
# 20040811_parsed = JSON.parse(nytimes_20040811_json)

# ~> LoadError
# ~> cannot load such file -- /Users/rolandobrown/GitHub/topline/learnlovecode.json
# ~>
# ~> /Users/rolandobrown/GitHub/topline/genuis.rb:3:in `require_relative'
# ~> /Users/rolandobrown/GitHub/topline/genuis.rb:3:in `<main>'
