LANGUAGE = 'english'
OPERATORS = %w(1 2 3 4)

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(key)
  message = MESSAGES[LANGUAGE][key]
  puts "=> #{message}"
end

def valid_name?(name)
  name != ''
end

def get_name
  loop do
    name = gets.chomp.delete "\s"

    return name if valid_name?(name)
    prompt('invalid_name')
  end
end

def num_validator(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def get_number
  loop do
    user_input = gets.chomp

    return user_input if num_validator(user_input)
    prompt('invalid_number')
  end
end

def valid_operator(num)
  OPERATORS.include?(num)
end

def get_operation
  loop do
    operation = gets.chomp

    return operation if valid_operator(operation)
    prompt('invalid_number')
  end
end

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

def numeric(num)
  return num.to_i if integer?(num)
  return num.to_f if float?(num)
end

def calculate(operator, first_number, second_number)
  case operator
  when '1'
    first_number + second_number
  when '2'
    first_number - second_number
  when '3'
    first_number * second_number
  when '4'
    first_number / second_number
  end
end

def dividing_by_zero(operator, denominator)
  operator == '4' && denominator == '0'
end

def get_operator(second_number)
  loop do # get operator and check for zero division
    operator = get_operation

    return operator unless dividing_by_zero(operator, second_number)
    prompt('zero_division_error')
  end
end

def get_answer
  loop do
    answer = gets.chomp

    return answer if answer == 'y' || answer == 'n'
    prompt('invalid_answer')
  end
end

# Start program
prompt('welcome')
name = get_name

puts "Hello #{name}!"

loop do
  prompt('first_number')
  first_number = get_number

  prompt('second_number')
  second_number = get_number

  prompt('operator_prompt')
  operator = get_operator(second_number)

  first_number  = numeric(first_number) # string to numeral
  second_number = numeric(second_number)

  result = calculate(operator, first_number, second_number)

  puts "The result is #{result}"

  prompt('retry?')

  answer = get_answer
  break if answer == 'n'
end

prompt('goodbye')
