CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  puts "=> #{message}"
end

def win_logic (user, computer)
  user == 'scissors' && computer == 'paper' ||
    user == 'paper' && computer == 'rock' ||
    user == 'rock' && computer == 'lizard' ||
    user == 'lizard' && computer == 'spock' ||
    user == 'spock' && computer == 'scissors' ||
    user == 'scissors' && computer == 'lizard' ||
    user == 'lizard' && computer == 'paper' ||
    user == 'paper' && computer == 'spock' ||
    user == 'spock' && computer == 'rock' ||
    user == 'rock' && computer == 'scissors'
end

def get_choice
  loop do
    input = gets.chomp

    return input if CHOICES.include?(input)
    prompt('Hmm... that does not look like a valid answer.')
  end
end

def valid_choice(input)
  input == 'r' ||
    input == 'p' ||
    input == 'sc' ||
    input == 'l' ||
    input == 'sp' ||
    input == 'rock' ||
    input == 'paper' ||
    input == 'scissors' ||
    input == 'lizard' ||
    input == 'spock'
end

def get_choice
  loop do
    input = gets.chomp
  
    return input if valid_choice(input)
    prompt('Hmm... that does not look like valid choice')
  end
end

def compare_choice(user, computer)
  if win_logic(user, computer)
    'win'
  elsif win_logic(computer, user)
    'lose'
  else
    'tie'
  end
end

def display_result(result)
  if result == 'win'
    prompt('You win!')
  elsif
    result == 'lose'
    prompt('You lost!')
  else
    prompt('It is a tie!')
  end
end

def get_answer
  loop do
    input = gets.chomp.downcase

    if input.start_with?('y') || input.start_with?('n')
      return input
    else
      prompt('Hmm... that does not look like a valid answer')
    end
  end
end

prompt('Welcome to rock paper scissors lizard spock!')
prompt('This is a best of 5!')

user_score = 0
comp_score = 0

loop do
  prompt('Make your choice:')
  choice = get_choice
  computer_choice = CHOICES.sample

  prompt("You chose #{choice}; computer chose #{computer_choice}")

  result = compare_choice(choice, computer_choice)
  display_result(result)

  if result == 'win'
    user_score += 1
  elsif result == 'lose'
    comp_score += 1
  else result == 'tie'
    (user_score += 0) && (comp_score += 0)
  end

  p user_score
  p comp_score
  break if user_score == 3 || comp_score == 3
end

prompt('Thank you for playing rock paper scissors lizard spock!')
