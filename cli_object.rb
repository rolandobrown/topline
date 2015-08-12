require 'pry'
require 'date'
require_relative './keys.rb'
require 'rest-client'
require 'json'

class Cli

  attr_accessor :welcome, :time, :name, :word
  # attr_reader :story_source, :story_headline, :song_source, :song_title, :song_lyrics
  #reader, and method to make them available
  # :name, :word_collection_array, :chosen_words,

  def initialize(name)
    @name = name
    @welcome = "Welcome to Topline #{name}"
    @time = Time.new.strftime("%Y%m%d")
    @@words = ""
  end

  def get_name
    puts "whats your name?"
    name = gets.chomp
    @name << name
    puts "Hello #{@name}"
  end

  def welcome
    puts "Welcome to Topline #{@name}"
    puts "Your favorite lyrics should be the latest news."
    puts "Today's date is: #{@time}"
  end

  def add_keyword(*words)
    puts "Type a keyword!"
    words.each do |word|
      keyword = gets.chomp
      @@words << keyword
    end
    @@words
    puts "-------------------NYTimes---------------------"
    puts "These stories talk about #{@@words} in some way"
    sleep 1
    puts
  end

  # def self.words
  #   @@words
  # end

  # def set_keywords_array
  #   keywords = "#{@@words}"
  # end

  # def self.words
  #   @@words
  # end

  # def set_keywords_array
  #   keywords = "#{@@words}"
  # end

  def map_array_with_index(array)
    array.map.with_index(1){|element, index| puts "#{index}. " "#{element}"}
  end

  def get_api_headline
    nytimes_today_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=#{@@words}&begin_date=#{@time}&end_date=#{@time}&hl=true&api-key=#{NYT}")
    today_parsed = JSON.parse(nytimes_today_json)
    today_docs_array = today_parsed["response"]["docs"]
    today_headlines_array = today_docs_array.collect {|doc| doc["headline"]["main"]}
    today_headlines_link = today_docs_array.collect {|doc| doc["web_url"]}
    map_array_with_index(today_headlines_array)
    map_array_with_index(today_headlines_link)
  end
end
