require 'pry'

class Tiles 

  def initialize(tiles_array, words_array)
      @titles_array = tiles_array
      @words_array = words_array
  end

  def get_letter_array(word)
    word.split(//)
  end

  def get_intersection_array(word)
    letter_array = word.split(//) #// means split a word into an array
    tiles_array = ["A", "B", "D", "E", "F", "I", "O", "R", "A", "W", "S", "M"]
    array = []
    letter_array.each do |letter|
       array << letter if tiles_array.include?(letter)
      end
      array.uniq
  end

  def longest_size_intersection(word)
    extra_letters_array = get_letter_array(word) - get_intersection_array(word)
    get_intersection_array(word).size - extra_letters_array.size
  end

  def arrays_are_equal(word)
    get_intersection_array(word).size == get_letter_array(word).size
  end

  def find_all_in_array(words)
    array = []
    words.each do |word|
      array << word if arrays_are_equal(word)
    end
    array
   end

  # http://blog.flatironschool.com/post/64974944098/rubys-7-best-kept-secrets

  def validation_new(array)
    hash = {}
    find_all_in_array(array).each do |word|
      hash[word] =  longest_size_intersection(word)
    end
    
    new_hash = hash.sort_by {|k, v| v}  
    new_hash.last # <-- this key is the biggest string
  end
end

tiles_array = ["A", "B", "D", "E", "F", "I", "O", "R", "A", "W", "S", "M"]
words_array = ["DOG", "FRIDA", "GOOD", "FOOD", "RED", "BROWNIE", "AWESOMEST", "FIORABADE", "ABDEFIORAWSMT"]

tiles = Tiles.new(tiles_array, words_array)
puts tiles.validation_new(words_array)