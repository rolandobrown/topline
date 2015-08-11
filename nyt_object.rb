require 'pry'

class Nytimes
  attr_reader :story_source, :story_headline

  def initialize
    @story_source = story_source
    @story_headline = story_headline
  end
end