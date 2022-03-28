LANGUAGE = 'english'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='english')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def operator_to_message(op)
  case op
  when '1'
    'added...'
  when '2'
    'subtracted...'
  when '3'
    'multiplied...'
  when '4'
    'divided...'
  end
end

def name_validator(input)
  input != ''
end

def get_name
  loop do
    name = gets.chomp

    if name_validator(name)
      return name
    else
      prompt('invalid_name')
    end
  end
end

def get_number1
  number1 = ''
  
  loop do
    puts prompt('number1')
    number1 = gets.chomp

    return number1 if valid_number?(number1)
    puts prompt('invalid_number1')
  end
end

def get_number2
  number2 = ''
  
  loop do
    puts prompt('number2')
    number2 = gets.chomp

    return number2 if valid_number?(number2)
    puts prompt('invalid_number2')
  end
end

def calculation(operation, num1, num2)
  if operation == '1'
    num1.to_i + num2.to_i
  end
end

puts prompt('welcome')

# ask for user name and validate
name = get_name

puts prompt('greeting') + " #{name}!" # Problem interpolating name variable.

# getting and validating user input
loop do # main loop
  number1 = get_number1

# getting and validating user input
  number2 = get_number2

  puts prompt('operator_prompt') # Does not display above text properly.

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    break if %w(1 2 3 4).include?(operator)
    puts prompt('valid_operator')
  end

  puts prompt('process') + " #{operator_to_message(operator)} "

  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  puts prompt('result') + " #{result}!" # Interpolation problem with #{result}.

  puts prompt('retry')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

puts prompt('goodbye')
