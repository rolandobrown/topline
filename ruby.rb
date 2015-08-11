# require 'net/http'
require_relative "./key.rb"  # => true
require 'rest-client'        # => true
# require 'pry'

nytimes_today_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20150811&end_date=20150811&hl=true&api-key=#{NYT}")  # ~> RestClient::Forbidden: 403 Forbidden
today_parsed = JSON.parse(nytimes_today_json)

# nytimes_20140811_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20140811&end_date=20150811&hl=true&api-key=$NYT")
# 20140811_parsed = JSON.parse(nytimes_20140811_json)
#
# nytimes_20040811_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20040811&end_date=20150811&hl=true&api-key=$NYT")
# 20040811_parsed = JSON.parse(nytimes_20040811_json)

today_parsed["response"]["docs"][0]["headline"]["main"]

# binding.pry

# parsed["tracks"].first(10).each.with_index(1) do |track, index|
#   puts "#{index}. #{track["track_name"]}"

# ~> RestClient::Forbidden
# ~> 403 Forbidden
# ~>
# ~> /Users/rolandobrown/.rvm/gems/ruby-2.2.1/gems/rest-client-1.8.0/lib/restclient/abstract_response.rb:74:in `return!'
# ~> /Users/rolandobrown/.rvm/gems/ruby-2.2.1/gems/rest-client-1.8.0/lib/restclient/request.rb:495:in `process_result'
# ~> /Users/rolandobrown/.rvm/gems/ruby-2.2.1/gems/rest-client-1.8.0/lib/restclient/request.rb:421:in `block in transmit'
# ~> /Users/rolandobrown/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/net/http.rb:853:in `start'
# ~> /Users/rolandobrown/.rvm/gems/ruby-2.2.1/gems/rest-client-1.8.0/lib/restclient/request.rb:413:in `transmit'
# ~> /Users/rolandobrown/.rvm/gems/ruby-2.2.1/gems/rest-client-1.8.0/lib/restclient/request.rb:176:in `execute'
# ~> /Users/rolandobrown/.rvm/gems/ruby-2.2.1/gems/rest-client-1.8.0/lib/restclient/request.rb:41:in `execute'
# ~> /Users/rolandobrown/.rvm/gems/ruby-2.2.1/gems/rest-client-1.8.0/lib/restclient.rb:65:in `get'
# ~> /Users/rolandobrown/GitHub/topline/ruby.rb:6:in `<main>'
