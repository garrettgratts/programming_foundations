=begin

Problem
  Create a hash that expresses the frequency with which each letter occurs in this string
  Input:
    String sentence
  Output:
    Hash of string characters, and values of string character frequency
Data Object
  Hash
Algorithm
  - Turn the string sentence into an array of characters
  - Remove empty strings
  - Iterate through the array
  - Find the count of the character
    - Using .count, and each character from the block argument
  -Append the count into a hash
    -
=end

statement = 'The Flintstones Rock'

# defining a method that takes a string and returns a hash of character frequencies

def letter_frequency(string)
  frequency_hash = {}
  string_arr = string.delete(' ').chars

  string_arr.each do |character|
    frequency = string_arr.count(character)
    frequency_hash[character] = frequency
  end

  print frequency_hash
end

letter_frequency(full_name)

# version with no method definition

frequency_hash = {}
string_arr = statement.delete(' ').chars

string_arr.each do |character|
  character_frequency = string_arr.count(character)
  frequency_hash[character] = character_frequency
end

p frequency_hash
