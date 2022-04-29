# return a new array of the same structure but with the sub arrays beign ordered (alphabetically or numerically as appropriate) in descending order

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

ans = arr.map do |array|
  array.sort_by do |a, b|
    b <=> a
  end
end

p ans
