CHOICES = %w(rock paper scissors lizard spock)

WIN_LOGIC = {
  rock: %w(lizard scissors),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  lizard: %w(spock paper),
  spock: %w(scissors rock)
}

def prompt(message)
  puts "=> #{message}"
end

def valid_choice(input)
  CHOICES.include?(input)
end

def translate(input)
  case input
  when 'r'  then input << 'ock'
  when 'p'  then input << 'aper'
  when 'sc' then input << 'issors'
  when 'l'  then input << 'izard'
  when 'sp' then input << 'ock'
  end
end

def get_choice
  loop do
    input = gets.chomp.downcase

    translate(input)
    return input if valid_choice(input)
    prompt('Hmm... that does not look like valid choice')
  end
end

def compare_choice(user, computer)
  if WIN_LOGIC[user.to_sym].include?(computer)
    'win'
  elsif WIN_LOGIC[computer.to_sym].include?(user)
    'lose'
  else
    'tie'
  end
end

def display_result(result)
  if result == 'win'
    prompt('You win!')
  elsif result == 'lose'
    prompt('You lost!')
  else
    prompt('It is a tie!')
  end
end

def game_complete?(player_score, computer_score)
  player_score == 3 || computer_score == 3
end

def display_grand_winner(player_score, computer_score)
  if player_score == 3
    prompt('### You are the grand winner! ###')
    prompt('---------------------------------')
  elsif computer_score == 3
    prompt('### HAL is the grand winner! ###')
    prompt('--------------------------------')
  end
end

def get_answer
  loop do
    input = gets.chomp.downcase

    return input if input.start_with?('y') || input.start_with?('n')
    prompt('Hmm... that does not look like a valid answer')
  end
end

prompt('Welcome to Rock Paper Scissors Lizard Spock!')
prompt('Compete in a best of 5 versus HAL 9000!')

player_score = 0
computer_score = 0

loop do
  prompt('Make your choice:')
  player_choice = get_choice
  computer_choice = CHOICES.sample

  prompt("You chose #{player_choice}; HAL chose #{computer_choice}")

  result = compare_choice(player_choice, computer_choice)
  display_result(result)

  player_score   += 1 if result == 'win'
  computer_score += 1 if result == 'lose'

  prompt("#{player_score} vs #{computer_score}")

  if game_complete?(player_score, computer_score)
    display_grand_winner(player_score, computer_score)

    prompt('Play again? (y/n)')
    break if get_answer == 'n'

    player_score = 0
    computer_score = 0
  end
end

prompt('Thank you for playing Rock Paper Scissors Lizard Spock!')
