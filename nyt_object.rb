require 'pry'

class Nytimes
  attr_reader :story_headline, :story_link

  def initialize(array)
    @story_headline = story_headline
    @story_link = story_link
  end

  def get_api_response
  end

  def get_api_headline(array)
  end
end

#