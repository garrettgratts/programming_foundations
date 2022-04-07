require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

def prompt(key)
  message = MESSAGES[key]
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def greater_than_zero(input)
  input.to_f > 0
end

def valid_input?(input)
  greater_than_zero(input) && (integer?(input) || float?(input))
end

def get_input
  loop do
    user_input = gets.chomp.delete "\s"

    return user_input if valid_input?(user_input)
    prompt('invalid_input')
  end
end

def calculation(principle, monthly_apr, months)
  principle.to_f *
    (monthly_apr / (1 - (1 + monthly_apr)**(-months)))
end

def get_integer_input
  loop do
    input = get_input

    return input unless float?(input)
    prompt('invalid_year')
  end
end

def get_answer
  loop do
    answer = gets.chomp.downcase

    return answer if answer == 'y' || answer == 'n'
    prompt('invalid_answer')
  end
end

loop do
  prompt('greeting')
  prompt('principle')
  principle = get_input

  prompt('interest_rate')
  interest_rate = get_input

  prompt('loan_duration')
  years = get_integer_input

  apr = interest_rate.to_f / 100
  monthly_apr = apr / 12
  months = years.to_i * 12

  monthly_payment = calculation(principle, monthly_apr, months)

  mortgage_info = <<-MSG
  --------------------------------------
  Principle: $#{principle}
  Interest Rate: #{interest_rate}%
  Loan Duration: #{years} years

  Your monthly payment is $#{monthly_payment.to_i}
  --------------------------------------
  MSG

  puts mortgage_info # didn't interpolate ruby and yaml
  prompt('calculate_again?')

  answer = get_answer
  break if answer == 'n'
end

prompt('goodbye')
