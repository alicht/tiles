tiles = ["A", "B", "D", "E", "F", "I", "O", "R", "A", "W", "S", "M"]
words = ["DOG", "FRIDA", "GOOD", "FOOD", "RED", "BROWNIE", "AWESOMEST", "FIORABADE", "ABDEFIORAWSMT"]

def longest_size_intersection(word)
  letter_array = word.split(//) #// means split a word into an array
  tiles_array = ["A", "B", "D", "E", "F", "I", "O", "R", "A", "W", "S", "M"]
  new_intersection_array = letter_array & tiles_array
  extra_letters_array = letter_array - new_intersection_array
  
  new_intersection_array.size - extra_letters_array.size
end

def longest_word_made_of_tiles(word)
  letter_array = word.split(//) #// means split a word into an array
  tiles_array = ["A", "B", "D", "E", "F", "I", "O", "R", "A", "W", "S", "M"]
  new_intersection_array = letter_array & tiles_array
  
  new_intersection_array.size == letter_array.size
end

def find_all_in_array(words)
  [].tap do |new_array|
    words.each do |word|
      new_array << word if longest_word_made_of_tiles(word)
    end
  end
 end

# http://blog.flatironschool.com/post/64974944098/rubys-7-best-kept-secrets

def validation_new(array)
  hash = {}
  find_all_in_array(array).each do |word|
    hash[word] =  longest_size_intersection(word)
  end
  
  new_hash = hash.sort_by {|k, v| v}	
  new_hash.last.first 
end

words = ["DOG", "FRIDA", "GOOD", "FOOD", "RED", "BROWNIE", "AWESOMEST", "FIORABADE", "ABDEFIORAWSMT"]
puts validation_new(words)