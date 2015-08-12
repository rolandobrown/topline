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
  #reader, and method to make them available 
  # :name, :word_collection_array, :chosen_words, 
  
  def initialize(name)
    @name = name
    @welcome = "Welcome to Topline #{name}"
    @time = Time.new.strftime("%Y-%m-%d")
    @@words = []
  end 

  def get_name
    puts "whats your name?"
    user_name = gets.chomp
    puts "Hello #{user_name}"
  end

  def welcome
    puts "Welcome to Topline #{name}"
    puts "Your favorite lyrics should be the latest news."
    puts "Today's date is: #{@time}" 
  end

  def add_keyword(*words)
    puts "Type a few of your favorite words!"
    words.each do |word|
      keyword = gets.chomp
      @@words << keyword
    end
    puts "Finding today's headlines that match #{@@words}"
  end

  def self.words
    @@words
  end

  def set_keywords_array
    keywords = "#{@@words}"
  end

  def get_api_headline(json_array)
    nyt_headline_one = "Learn Some Title" ##put the json call here
    nyt_headline_two = "Love Some Title"
    nyt_headline_three = "Code Some Title"
    puts nyt_headline_one
    puts nyt_headline_two
    puts nyt_headline_three
  end

  
end



