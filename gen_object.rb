require 'pry'

class Genius
  attr_reader :song_source, :song_title, :song_lyrics

  def initialize
    @song_lyrics = song_lyrics
    @song_title = song_title
    @song_source = song_source
  end
end