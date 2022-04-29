arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

# if the sum of all values in the hash, put that hash in array

arr.select do |hash|
  hash.all? do |key, array|
    array.all? { |num| num.even? }
  end
end
