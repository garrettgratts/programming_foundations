=begin
Pick out the minimum age from our current Munster family hash:

Problem
  Retreive the lowest integer value out of a hash
Data Object
  Hash
Algorithm
 - Iterate through every value in the hash
 - Select the smallest value
=end

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

smallest_value = ages["Herman"]

ages.each do |name, age|
  current_value = age

  if current_value < smallest_value
    smallest_value = current_value
  end
end

p smallest_value

# or ages.values.min
