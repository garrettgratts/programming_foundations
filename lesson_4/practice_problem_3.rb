=begin
remove people with age 100 and greater.

Problem
  Remove pairs with values equal to or greater than 100
  Input: Hash
  Output: Hash
Data Objects
  Hash
Algorithm
  - Iterate through the hash, check the value of each pair
  - If the value is valid, remove the pair
  - Return the original hash, or a new one
=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if do |key, value|
  value >= 100
end

p ages
