WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd, player_score, computer_score)
  puts "=> Player: #{player_score[0]} vs Computer: #{computer_score[0]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_example
  example = {}
  (1..9).each { |num| example[num] = num }
  example
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square: #{joinor(empty_squares(brd), ', ', 'or')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def computer_ai_algo(brd, marker) # returns square or nil
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(brd, line, marker)
    break if square
  end
  square
end

def computer_places_piece!(brd)
  square = computer_ai_algo(brd, COMPUTER_MARKER) # ai attack
  if !square
    square = computer_ai_algo(brd, PLAYER_MARKER) # ai defense
  end

  if !square && empty_squares(brd).include?(5)
    square = 5
  elsif !square
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(array, delimiter = ', ', word = 'or')
  if array.size > 1
    array[-1] = "#{word} #{array[-1]}"
  end
  array.join(delimiter)
end

def update_score(brd, player_score, computer_score)
  case detect_winner(brd)
  when 'Player'   then player_score[0] += 1
  when 'Computer' then computer_score[0] += 1
  end
end

def display_score(player_score, computer_score)
  prompt "You are an #{PLAYER_MARKER}, computer is an #{COMPUTER_MARKER}"
  prompt "Score: #{player_score[0]} versus #{computer_score[0]}"
end

def find_at_risk_square(brd, line, marker)
  two_markers  = brd.values_at(*line).count(marker) == 2
  empty_square = brd.values_at(*line).count(INITIAL_MARKER) == 1

  if two_markers && empty_square
    square = line.select { |key| brd[key] == INITIAL_MARKER }.first
  end
  square
end

def decide_first_turn
  loop do
    choices = {
      '1' => 'Player',
      '2' => 'Computer',
      '3' => %w(Player Computer).sample
    }
    answer = gets.chomp
    return choices[answer] if choices.keys.include?(answer)
    prompt "That's not a valid answer."
  end
end

def alternate_player(current_player) # remove return syntax to see glitch
  return 'Computer' if current_player == 'Player'
  return 'Player' if current_player == 'Computer'
end

def place_piece!(brd, current_player)
  case current_player
  when 'Player' then player_places_piece!(brd)
  else
    sleep 0.3 unless brd.values.all?(' ')
    computer_places_piece!(brd)
  end
end

def grand_winner?(player_score, computer_score)
  player_score == [5] || computer_score == [5]
end

prompt 'Welcome to tic-tac-toe, on terminal!'
prompt 'Each square is referenced by a number'

example_board = initialize_example
display_board(example_board, [0], [0])

player_score = [0]
computer_score = [0]

prompt 'The first player to 5 points wins the game'
prompt 'Who should go first?
  1) Player
  2) Computer
  3) Let computer decide'
current_player = decide_first_turn

loop do
  board = initialize_board
  loop do
    system 'clear'
    display_board(board, player_score, computer_score)
    place_piece!(board, current_player)

    break if someone_won?(board) || board_full?(board)
    current_player = alternate_player(current_player)
  end

  system 'clear'
  update_score(board, player_score, computer_score)
  display_board(board, player_score, computer_score)
  sleep 1

  if grand_winner?(player_score, computer_score)
    prompt "#{detect_winner(board)} won!"
    break
  end
end

prompt 'Thanks for playing tic-tac-toe! Goodbye!'
