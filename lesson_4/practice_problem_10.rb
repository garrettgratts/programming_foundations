=begin

Problem
  Modify the hash such that each member of the Munster family hash has an additional
  "age_group" key that has one of three values describing the age group the family
  member is in (kid, adult, senior).
Data Object
  Hash
Algorithm
  - Iterate through the values of the hash
  - The values are hashes so create a new pair and add it to each value
    - Depending on the age range, assign the age_group the desired string
  - Return the original hash, now modified

=end



munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  if details["age"] <= 17
    details["age_group"] = "kid"
  elsif details["age"] >= 18 && details["age"] <= 65
    details["age_group"] = "adult"
  elsif details["age"] > 65
    details["age_group"] = "senior"
  end
end

p munsters
