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
  (num.to_i.to_s == num) || (num.to_f.to_s == num)
end

def num_retriever
  loop do
    user_input = gets.chomp

    if num_validator(user_input)
      return user_input
    else
      prompt('Please enter valid number')
    end
  end
end

def valid_operator(num)
  %w(1 2 3 4).include?(num)
end

def get_operator
  loop do
  operator = gets.chomp

    if valid_operator(operator)
      return operator
    else
      prompt('Please enter valid number')
    end
  end
end

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

def calculate(operator, num1, num2)
  if 
  
  case operator
  when '1'
  when '2'
  when '3'
  when '4'
end

prompt('Hello, welcome to calculator! Enter your name:')
name = name_validator

prompt("Hello, #{name}!")

prompt('Enter first number:')
first_number = num_retriever

prompt('Enter second number:')
second_number = num_retriever

prompt('Select method of operation: 1) add 2) subtract 3) multiply 4) divide')
operator = get_operator

calculate(operator, first_number, second_number)
