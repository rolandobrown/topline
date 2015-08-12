require_relative "./key.rb"
require 'rest-client'
require 'pry'
require_relative 'cli_object'

class Nytimes < Cli
  @@words = []

class Nytimes

  attr_reader :story_headline, :story_link
  attr_accessor :set_keywords_array

  def initialize
    super
    @story_headline = story_headline
    @story_link = story_link
    @@words << self
  end

  def get_nyt_headline(today_parsed)
    today_docs_array = today_parsed["response"]["docs"]
    today_headlines_array = today_docs_array.collect {|doc| doc["headline"]["main"]}
  end

  def set_keywords_array
    "#{@@words}"
  end

  def compare_keywords
    set_keywords_array
  end

  def get_api_headline(json_array)
    from_nytimes = super
    "Here are a few matching headlines: #{from_nytimes}"
  end
end
