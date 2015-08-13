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
    @@headlines_plus_songs = ""
    @@songs = ""
  end

  def get_name
    puts "whats your name?"
    name = gets.chomp
    @name << name
    puts "Hello #{@name}"
  end

  def welcome
    puts "Welcome to Topline #{@name}"
    puts "Your favorite words should be in the latest news & tunes."
    puts "Today's date is: #{@time}"
  end

  def add_keyword(*words)
    puts "Type a keyword!"
    words.each do |word|
      keyword = gets.chomp
      @@words << keyword
    end
    @@words
    puts "-------------------NYTimes & Genuis---------------------"
    puts "These stories & songs talk about #{@@words} in some way"
    sleep 1
    puts
  end

  def map_array_with_index_headline(array)
    array1 = array.map.with_index(1){|element, index| puts "Headline #{index}. " "#{element}" unless index > @@words.length}
    array1
  end

  def map_array_with_index_song(array)
    array1 = array.map.with_index(1){|element, index| puts "Song #{index}. " "#{element}" unless index > @@words.length}
    array1
  end

  def map_array_with_index_link(array)
    array1 = array.map.with_index(1){|element, index| puts "Link #{index}. " "#{element}" unless index > @@words.length}
    array1
  end

  def map_array_with_index_song_link(array)
    array1 = array.map.with_index(1){|element, index| puts "Song url #{index}. " "#{element}" unless index > @@words.length}
    array1
  end

  def map_array_with_index_artist(array)
    array1 = array.map.with_index(1){|element, index| puts "Artist #{index}. " "#{element}" unless index > @@words.length}
    array1
  end

  def get_api_headline
    nytimes_today_json = RestClient.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=#{@@words}&begin_date=#{@time}&end_date=#{@time}&hl=true&api-key=#{NYT}")
    today_parsed = JSON.parse(nytimes_today_json)
    today_docs_array = today_parsed["response"]["docs"]
    today_headlines_array = today_docs_array.collect {|doc| doc["headline"]["main"]}
    today_headlines_link = today_docs_array.collect {|doc| doc["web_url"]}
    map_array_with_index_headline(today_headlines_array)
    map_array_with_index_link(today_headlines_link)
    puts
  end

  def parse_gen_json
    if @@words = "love"
      file_love = File.read('love.json')
      love_parsed = JSON.parse(file_love)
      today_love_songs_array = love_parsed["response"]["hits"]
      today_love_songs = today_love_songs_array.collect {|hit| hit ["result"]["title"]}
      today_love_songs_artists = today_love_songs_array.collect {|hit| hit ["result"]["primary_artist"]["name"]}
      today_love_songs_link = today_love_songs_array.collect {|hit| hit["result"]["url"]}
      song = map_array_with_index_song(today_love_songs)
      artist = map_array_with_index_artist(today_love_songs_artists)
      link = map_array_with_index_song_link(today_love_songs_link)
    elsif  @@words = "learn"
      file_learn = File.read('learn.json')
      learn_parsed = JSON.parse(file_love)
      today_learn_songs_array = learn_parsed["response"]["hits"]
      today_learn_songs = today_learn_songs_array.collect {|hit| hit ["result"]["title"]}
      today_learn_songs_link = today_learn_songs_array.collect {|hit| hit["result"]["url"]}
      map_array_with_index_song(today_learn_songs)
      map_array_with_index_link(today_learn_songs_link)
    elsif @@words = "code"
      file_code = File.read('code.json')
      code_parsed = JSON.parse(file_love)
      today_code_songs_array = code_parsed["response"]["hits"]
      today_code_songs = today_code_songs_array.collect {|hit| hit ["result"]["title"]}
      today_code_songs_link = today_code_songs_array.collect {|hit| hit["result"]["url"]}
      map_array_with_index_song(today_code_songs)
      map_array_with_index_link(today_code_songs_link)
    end
    puts
  end

  def return_code_song_name
    puts @@song_titles
  end
end
