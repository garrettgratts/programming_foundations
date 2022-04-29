=begin

Problem
  How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?
Data Structure
  Array, and hash
Algorithm
  - sort the array elements by comparing the years
  - turn years into integers to compare
=end

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

ans = books.sort_by do |hash|
  hash[:published]
end

puts ans
