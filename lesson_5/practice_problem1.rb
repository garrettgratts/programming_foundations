=begin

Problem
  Order this array of number strings by descending numeric value
Data Structure
  Array
Algorithm
  - Transform the array into an array of integers
  - Sort the array
=end

arr = ['10', '11', '9', '7', '8']

sorted_arr = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p sorted_arr
