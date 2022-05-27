BUST_LIMIT = 21
DEALER_LIMIT = 17
BOX_LENGTH = 23

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  ranks = (2..10).to_a + ['Jack', 'King', 'Queen', 'Ace']
  suits = ['Hearts', 'Spades', 'Diamonds', 'Clubs']
  ranks.product(suits).shuffle
end

def draw_two_cards(deck)
  cards = deck.shift, deck.shift
  cards
end

def draw_card(deck)
  deck.shift
end

def points(card)
  case card
  when 'Ace'   then 11
  when 'Queen' then 10
  when 'King'  then 10
  when 'Jack'  then 10
  else card
  end
end

def calculate_aces(total, ace_count)
  while total > BUST_LIMIT && ace_count > 0
    total -= 10
    ace_count -= 1
  end
  total
end

def total(cards)
  total = 0
  ace_count = 0

  cards.each do |rank, _suit|
    total += points(rank)
    ace_count += 1 if rank == 'Ace'
  end

  total = calculate_aces(total, ace_count)
end

def busted?(cards)
  total(cards) > BUST_LIMIT
end

def format_spaces(total_spaces)
  space = ' '
  if total_spaces.odd?
    [space * (total_spaces / 2), space * (total_spaces / 2) + space]
  else
    [space * (total_spaces / 2), space * (total_spaces / 2)]
  end
end

def calculate_spaces(rank, suit)
  card_length = "#{rank} of #{suit}".length
  total_spaces = BOX_LENGTH - card_length
  format_spaces(total_spaces)
end

def card_box(rank, suit)
  left_spaces, right_spaces = calculate_spaces(rank, suit)

  <<-CARD
  +-----------------------+
  |                       |
  |#{left_spaces}#{rank} of #{suit}#{right_spaces}|
  |                       |
  +-----------------------+
  CARD
end

def display_players_hand(players_cards)
  prompt "Your hand: #{total(players_cards)}"

  players_cards.each do |rank, suit|
    puts card_box(rank, suit)
  end
end

def display_dealers_card(dealers_cards)
  prompt "Dealers hand: ???"

  puts card_box(dealers_cards[0].first, dealers_cards[0].last)
  puts card_box('???', '???')
end

def display_all_hands(players_cards, dealers_cards)
  prompt "Your hand: #{total(players_cards)}"
  players_cards.each { |rank, suit| puts card_box(rank, suit) }

  prompt "Dealers hand: #{total(dealers_cards)}"
  dealers_cards.each { |rank, suit| puts card_box(rank, suit) }
end

def final_results(players_cards, dealers_cards)
  case total(players_cards) <=> total(dealers_cards)
  when 1
    prompt 'You win!'
    'Player'
  when 0
    prompt "It's a tie!"
  else
    prompt 'You lose!'
    'Dealer'
  end
end

def display_scores(scores)
  system 'clear'
  prompt "Grand Score: Player #{scores[:player_score]}" \
         " vs Dealer #{scores[:dealer_score]}"
  puts '------------------------------------'
end

def grand_winner?(scores)
  if scores[:player_score] == 3 || scores[:dealer_score] == 3
    true
  else
    false
  end
end

def reset_scores(scores)
  scores[:player_score] = 0
  scores[:dealer_score] = 0
end

def update_scores!(scores, player_cards, dealer_cards)
  system 'clear'

  if busted?(player_cards)
    scores[:dealer_score] += 1
  elsif busted?(dealer_cards)
    scores[:player_score] += 1
  end
end

def rematch?(player_cards, dealer_cards)
  loop do
    if busted?(player_cards)
      prompt 'You lose!'
    elsif busted?(dealer_cards)
      prompt 'You win!'
    end

    prompt 'Play again? (y/n)'
    answer = gets.chomp.downcase

    if answer == 'y'
      system 'clear'
      return answer
    end
    break
  end
end

def prompt_to_continue
  prompt 'Enter any key to continue'
  gets.chomp
  system 'clear'
end

def instructions
  <<-MSG
  -----------------
  Ace   | 11 points
  Queen | 10 points
  King  | 10 points
  Jack  | 10 points
  1-10  | num value
  -----------------
  MSG
end

def greeting
  loop do
    prompt "Welcome to #{BUST_LIMIT}, on terminal!"
    puts instructions
    prompt 'This is a best of 3!'
    prompt_to_continue
    break
  end
end

def update_final_score!(scores, players_cards, dealers_cards)
  winner = final_results(players_cards, dealers_cards)
  scores[:player_score] += 1 if winner == 'Player'
  scores[:dealer_score] += 1 if winner == 'Dealer'
end

def player_has_21?(players_cards)
  if total(players_cards) == BUST_LIMIT
    prompt 'Wow, you have 21!'
    prompt_to_continue
    true
  end
end

def player_hits(deck, players_cards)
  prompt "You are about to hit..."
  sleep 1
  players_cards << draw_card(deck)
end

def prompt_player
  prompt 'Hit or stay?'
  answer = ''
  loop do
    answer = gets.chomp.downcase
    break if answer == 'hit' || answer == 'stay'
    prompt 'That is not a valid answer'
  end
  answer
end

def stayed?(answer)
  if answer == 'stay'
    prompt 'You stayed!'
    sleep 1
    true
  end
end

scores = { player_score: 0, dealer_score: 0 }
greeting

loop do
  deck = initialize_deck

  players_cards = draw_two_cards(deck)
  dealers_cards = draw_two_cards(deck)

  loop do
    display_scores(scores)
    display_players_hand(players_cards)
    display_dealers_card(dealers_cards)
    break if player_has_21?(players_cards)
    answer = prompt_player
    player_hits(deck, players_cards) if answer == 'hit'
    break if stayed?(answer) || busted?(players_cards)
  end

  update_scores!(scores, players_cards, dealers_cards)
  display_scores(scores)
  display_all_hands(players_cards, dealers_cards)

  if grand_winner?(scores)
    prompt 'You busted!'
    break unless rematch?(players_cards, dealers_cards)
    reset_scores(scores)
    next
  elsif busted?(players_cards)
    prompt 'You busted!'
    prompt_to_continue
    next
  end

  until busted?(dealers_cards)
    display_scores(scores)
    display_all_hands(players_cards, dealers_cards)
    break if total(dealers_cards) >= DEALER_LIMIT
    prompt 'Dealer is about to hit!'
    dealers_cards << draw_card(deck)
    prompt_to_continue
  end

  update_scores!(scores, players_cards, dealers_cards)
  display_scores(scores)
  display_all_hands(players_cards, dealers_cards)

  if grand_winner?(scores)
    prompt 'Dealer busted!'
    break if rematch?(players_cards, dealers_cards)
    reset_scores(scores)
    next
  end

  prompt 'Dealer has at least 17!'
  prompt 'Calculating results...'
  sleep 1.5
  update_final_score!(scores, players_cards, dealers_cards)

  if grand_winner?(scores)
    break unless rematch?(players_cards, dealers_cards)
    reset_scores(scores)
    next
  else
    prompt_to_continue
  end
end

prompt 'Thank you for playing twenty-one!'
