# require_relative "./key.rb"
require_relative 'cli_object.rb'
require 'pry'
require 'json'

class Genius < Cli
  attr_reader :song_source, :song_title, :song_lyrics

  def initialize
    # @song_lyrics = song_lyrics
    # @song_title = song_title
    # @song_source = song_source
    @@song_titles = ""
  end

  def parse_gen_json
    if @@words = "love"
        file_love = File.read('love.json')
        love_parsed = JSON.parse(file_love)
        today_love_songs_array = love_parsed["response"]["hits"]
        today_love_songs = today_love_songs_array.collect {|hit| hit ["result"]["title"]}
        @@song_titles << today_love_songs
    elsif  @@words = "learn"
      file_learn = File.read('learn.json')
      learn_parsed = JSON.parse(file_love)
      today_learn_songs_array = learn_parsed["response"]["hits"]
      today_learn_songs = today_learn_songs_array.collect {|hit| hit ["result"]["title"]}
      @@song_titles << today_learn_songs
    elsif @@words = "code"
      file_code = File.read('code.json')
      code_parsed = JSON.parse(file_love)
      today_code_songs_array = code_parsed["response"]["hits"]
      today_code_songs = today_code_songs_array.collect {|hit| hit ["result"]["title"]}
      @@song_titles << today_code_songs
    end
    @@song_titles
  end

  def return_code_song_name
    puts @@song_titles
  end
end
