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
    @@song_title = ""
  end

  def parse_gen_json
    if @@words = "love"
        file_love = File.read('love.json')
        love_hash = JSON.parse(file_love)
        today_love_songs_array ["response"]["hits"]["result"]["title"]
        today_love_song = today_love_songs_array.collect {|doc| doc ["response"]["hits"]["result"]["title"]}
        @@song_title << today_love_song
    elsif  @@words = "learn"
      file_learn = File.read('learn.json')
      learn_hash = JSON.parse(file_learn)
      today_learn_songs_array = learn_hash["response"]["hits"]["result"]
      today_learn_song = today_learn_hash.collect {|doc| doc ["response"]["hits"]["result"]["title"]}
      @@song_title << today_love_song
    elsif @@words = "code" # replace with @@words
      file_code = File.read('code.json')
      code_hash = JSON.parse(file_code)
      today_code_songs_array ["response"]["hits"]["result"]["title"]
      today_code_song = today_love_songs_array.collect {|doc| doc ["response"]["hits"]["result"]["title"]}
      @@song_title << today_code_song
    end
    @@song_title
    binding.pry
  end

  def return_code_song_name(code_hash)
    code_hash.each do |k, v|
      binding.pry
    end
  end
end
