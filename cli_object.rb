require 'pry'
require 'date'
require_relative "./key.rb"
require 'rest-client'
require 'pry'

nytimes_today_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=love&begin_date=20150811&end_date=20150811&hl=true&api-key=#{NYT}")
today_parsed = JSON.parse(nytimes_today_json)

today_docs_array = today_parsed["response"]["docs"]
today_headlines_array = today_docs_array.collect {|doc| doc["headline"]["main"]}

class Cli
  attr_accessor :welcome, :time, :name, :word
  # attr_reader :story_source, :story_headline, :song_source, :song_title, :song_lyrics
  
  # :name, :word_collection_array, :chosen_words, 

  def initialize(name)
    @name = name
    @welcome = welcome
    @time = Time.new.strftime("%Y%m%d")
    @words = []
  end 

  def get_name
    puts "whats your name?"
    user_name = gets.chomp
    puts "Hello #{user_name}"
  end

  def welcome
    puts "Welcome to Topline #{name}"
    puts "Your favorite lyrics should be the latest news."
    puts "Today's date is: #{time}" 
    puts "Begin typing your keywords:"
  end

  def add_keyword(*words)
    puts "Type a few of your favorite words!"
    words.each do |word|
      keyword = gets.chomp
      @words << keyword
    end
    @words
    binding.pry
  end
end

george = Cli.new("George")
george.name == "George"
george.welcome
george.time
george.add_keyword(" ")
