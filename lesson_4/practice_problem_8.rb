numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

=begin
the loop counter used by #each is compared against the currect length of the
array rather than its original length. In out first example, the removal of
the first item in the first pass changes the value found for the second pass.
In our second example, we are shortening the array each pass ust as in the
first example...but the items removed are beyond the point we are sampling
from in the abbreviated loop. In both cases we see that iterators DO NOT work
on a copy of the original array or from state meta-date (length) about the 
array. They operate on the original array in real time. 

