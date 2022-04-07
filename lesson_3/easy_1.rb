=begin

Question 1

1
2
2
3

Question 2

The difference ebetween ! and ? in Ruby is that 
1. != means 'not equivilant to'. You should use it when you want to compare two things and return a boolean.
2. !<some_object> is user to turn an object into the opposite of their boolean equivalent.
3. Putting ! after something, like a method (uniq), will usually make the method destructive.
4. Putting ? before something creates half a ternary operator.
5. Putting ? after something creates a ternary operator.
6. !!<some_object> is used to turn an object into its boolean equivalent.

Question 3

advice.gsub!('important', 'urgent')

Question 4

arr.delete_at(1) removes and returns the element at index 1
arr.delete(1) removes and returns the element 1

Question 5

(10..100).include?(42) or (10..100).cover?(42)

Questions 6

intro << famous_words
"#{intro} #{famous_words}"
'Four score and ' + famous_words
famous_words.prepend('Four score and ')

Question 7

flintstones.flatten!

Question 8

flintstones.flatten.select! { |element| element == "Barney" || element == 2 }

flintstones.assoc("Barney")
=end
