require 'pry'
require 'json'

class Genius
  attr_reader :song_title, :gen_words

  def initialize
    super
    @gen_words = gen_words
  end

  def test_gen_method(array)
    @gen_words
    binding.pry
  end

  # # file_love = File.read('love.json')
  # file_learn = File.read('learn.json')
  # # file_code = File.read('code.json')

  # learn_hash = JSON.parse(file_learn)
  # love_hash = JSON.parse(file_love)
  # code_hash = JSON.parse(file_code)

  # def return_code_song_name(learn_hash)
  #   learn_hash.each do |k, v|
  #     learn_hash["title"] 
  #     binding.pry
  #   end
  # end  
end

Genius.new
["test"].test_gen_method