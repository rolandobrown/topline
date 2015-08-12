require 'pry'

class Genius
  attr_reader :song_source, :song_title, :song_lyrics

  def initialize
    @song_lyrics = song_lyrics
    @song_title = song_title
    @song_source = song_source
  end

  file_love = File.read('love.json')
  file_learn = File.read('learn.json')
  file_code = File.read('code.json')

  learn_hash = JSON.parse(file_learn)
  love_hash = JSON.parse(file_love)
  code_hash = JSON.parse(file_code)

  def return_code_song_name(code_hash)
    code_hash.each do |k, v|
      binding.pry
    end
  end  
end
