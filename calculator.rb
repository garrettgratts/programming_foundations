# greet user
# retrieve name
# retreive first and second numbers
# calculate
# repeat if desired
LANGUAGE = 'english'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='english')
  MESSAGES[lang][message]
end

def prompt(msg)
  puts "=> #{msg}"
end

def name_validator
  loop do
    name = gets.chomp

    return name if name != ''
    prompt(messages('invalid_name'))
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
      prompt(messages('invalid_number'))
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
      prompt(messages('invalid_number'))
    end
  end
end

def float?(num)
  num.to_f.to_s == num
end

def integer?(num)
  num.to_i.to_s == num
end

def convert(num)
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

loop do
  prompt(messages('welcome'))
  name = name_validator

  prompt("Hello, #{name}!")

  prompt(messages('first_number'))
  first_number = num_retriever

  prompt(messages('second_number'))
  second_number = num_retriever

  prompt(messages('operator_prompt'))
  operator = get_operator

  first_number = convert(first_number)
  second_number = convert(second_number)

  result = calculate(operator, first_number, second_number)

  prompt("The result is #{result}")

  prompt(messages('retry?'))

  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
