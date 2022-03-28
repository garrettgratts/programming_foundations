# greet user
# retrieve name
# retreive first and second numbers
# calculate 
# repeat if desired

def prompt(msg)
  puts "=> #{msg}"
end

def name_validator
  loop do
    name = gets.chomp

    return name if name != ''
    prompt('Please enter a valid name')
  end
end

def num_validator(num)
  num.to_i.to_s == num
end

def num_retriever
  loop do
    user_input = gets.chomp

    if num_validator(user_input)
      user_input
    else
      prompt('Please enter valid number')
    end
  end
end

prompt('Hello, welcome to calculator! Enter your name:')
name = name_validator

prompt('Enter first number:')
first_number = num_retriever

prompt('Enter second number:')
second_number = num_retriever

p first_number
p second_number
