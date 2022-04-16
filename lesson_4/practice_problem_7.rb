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
full_name = 'Garrett Chadwick Gratts'

def letter_frequency(string)
  frequency_hash = {}
  string_arr = string.chars
  string_arr.delete(' ')

  string_arr.each do |character|
    frequency = string_arr.count(character)
    frequency_hash[character] = frequency
  end

  print frequency_hash
end

letter_frequency(full_name)
