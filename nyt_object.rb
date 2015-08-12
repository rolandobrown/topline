require 'pry'
require_relative 'cli_object'

class Nytimes < Cli
  @@words = []

  attr_reader :story_headline, :story_link

  def initialize
    super
    @story_headline = story_headline
    @story_link = story_link
    @@words << self
  end

  def set_keywords_array
    "#{@words}".shift
  end

  def compare_keywords(json)

  end

# #######put this in the cli_object
#   def get_api_headline(array)
#     from_nytimes = super
#     "#{from_nytimes} run the json call"
#     all the business in the cli_object class
#   end
end

george = Cli.new("George")
george.name == "George"
george.welcome
george.time
george.add_keyword(" ")