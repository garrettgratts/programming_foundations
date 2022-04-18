=begin

Problem
  Create a string that has each word capitalized
Data Structure
  Array
Algorithm
  - Turn the strong into an array of words
  - Iterate through the array
  - Capitalize each word in the array
  - Turn the array back into a string sentence
=end

words = "the flintstones rock"


words.split.each {|word| word.capitalize! }.join(' ')
words
