=begin

Problem
  add up all of the ages from the Munster family hash:
  input: hash
  output: integer
Data Structure
  Hash
Algorithm
  - Iterate through the hash
  - Select every value
  - Return the sum of the values
=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = 0
ages.each do |name, age|
  sum += age
end
puts sum
