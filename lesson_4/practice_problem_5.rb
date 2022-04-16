=begin
Find the index of the first name that starts with "Be"

Problem
  Return the index of the first element that starts with "Be"
Data Object
  Array
Algorithm
  - Iterate through the array
  - Find the first element that begins with "Be"
  - Return the index of that element
=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index = []
flintstones.each do |name|
  index << flintstones.index(name) if name.start_with?('Be')
end

flintstones.index { |name| name.start_with?('Be')}
