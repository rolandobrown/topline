# require_relative "./key.rb"
require 'pry'
require 'json'

class Genius
  attr_reader :song_source, :song_title, :song_lyrics

  def initialize
    @song_lyrics = song_lyrics
    @song_title = song_title
    @song_source = song_source
  end

  def parse_gen_json(*words)

    if love # replace with @@words
        file_love = File.read('love.json')
        love_hash = JSON.parse(file_love)
        today_songs_array ["response"]["hits"]["result"]["title"]

    end
    if learn # replace with @@words
      file_learn = File.read('learn.json')
      learn_hash = JSON.parse(file_learn)
      today_songs_array ["response"]["hits"]["result"]["title"]

    end
    if code # replace with @@words
      file_code = File.read('code.json')
      code_hash = JSON.parse(file_code)
      today_songs_array ["response"]["hits"]["result"]["title"]

    end

  end

  def return_code_song_name(code_hash)
    code_hash.each do |k, v|
      binding.pry
    end
  end
end
