# require 'pry'
require 'rest-client'

nytimes_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20140801&end_date=20150811&hl=true&api-key=a57ede7197e1dcd924d49a1096872f43%3A4%3A64905532")
parsed = JSON.parse(nytimes_json)

parsed["docs"].first(10).each.with_index(1) do |main, index|
  binding.pry
  puts "#{ind}. #{docs["main"]}"
end


# binding.pry
