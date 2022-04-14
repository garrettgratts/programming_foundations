=begin
Turn this array into a hash where the names are the keys and the values are the positions in the array.

Problem
  Transform this array into a hash. Make the array elements hash keys and the positions hash values.
  Not sure if the question wants me to transform this array or return a new one.
Data Structure/Algorithm
  Obviously I will be creating a hash. 
  - Iterate through the array with a method that takes a block
  - Create an empty hash
  - Create new hash pairs using the block argument as keys
  - Calling the .index method with the block argument as the paramenter, will return the index for each object.
=end

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

def create_hash(array)
  new_hash = {}
  array.each do |name|
    new_hash[name] = array.index(name)
  end

  new_hash
end

p create_hash(flintstones)
