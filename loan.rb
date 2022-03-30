def prompt(message)
  Kernel.puts("=> #{message}")
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
    user_input = gets.chomp

    return user_input if valid_input?(user_input)
    prompt("Must enter positive number.")
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
    prompt("Part of a year? Please try again, how many years?")
  end
end

loop do
  prompt("Welcome to Mortgage Calculator!")
  prompt("-------------------------------")

  prompt("What is the principle?")

  principle = get_input

  prompt("What is the interest rate?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = get_input

  prompt("What is the loan duration (in years)?")

  years = get_integer_input

  apr = interest_rate.to_f / 100
  monthly_apr = apr / 12
  months = years.to_i * 12

  monthly_payment = calculation(principle, monthly_apr, months)

  prompt("Your monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt("Calculate again? (Y to calculate again)")

  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Goodbye!")
