=begin

Problem
  Amend this array so that the names are all shortened to just the first three characters
Data Object
  Array
Algorithm
  - Iterate through the array
  - Transform every element with a different string
=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Returns a new string on each iteration
shortened_names = []

flintstones.each do |name|
  shortened_names << name[0, 3]
end

shortened_names

# Mutates string on each iteration

flintstones.each do |name|
  name.slice!(4..)
end
