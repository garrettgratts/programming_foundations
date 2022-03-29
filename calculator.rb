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

def prompt(key)
  messages = messages(key,LANGUAGE)
  "=> #{messages}"
end

# def ruby_prompt(msg)
#   puts "=> #{msg}"
# end

def name_validator
  loop do
    name = gets.chomp

    return name if name != ''
    puts prompt('invalid_name')
  end
end

def num_validator(num)
  (num.to_i.to_s == num) || (num.to_f.to_s == num)
end

def num_retriever
  loop do
    user_input = gets.chomp

    return user_input if num_validator(user_input)
    puts prompt('invalid_number')
  end
end

def valid_operator(num)
  %w(1 2 3 4).include?(num)
end

def get_operator
  loop do
    operator = gets.chomp

    return operator if valid_operator(operator)
    puts prompt('invalid_number')
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

puts prompt('welcome')
name = name_validator

puts prompt('Hello') + " #{name}!"

loop do # main loop
  puts prompt('first_number')
  first_number = num_retriever

  puts prompt('second_number')
  second_number = num_retriever

  puts prompt('operator_prompt')
  operator = get_operator

  first_number = numeric(first_number) # string to numeral
  second_number = numeric(second_number)

  result = calculate(operator, first_number, second_number)

  puts prompt('') # the numbers are being + "#{added...}"
  puts prompt('result') + " #{result}"

  puts prompt('retry?')

  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

puts prompt('goodbye')
