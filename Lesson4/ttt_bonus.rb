FIRST_MOVE = 'choose'.freeze
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(array, delimiter=', ', word='or')
  array[-1] = "#{word} #{array.last}" if array.size > 1
  array.join(delimiter)
end

def score_board_display(player, computer, ties)
  puts "Player Wins: #{player} Computer Wins: #{computer} Tie Games: #{ties}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear' || 'clr'
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |   #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |   #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |   #{brd[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def intialize_board
  new_board = {}
  (1..9).each { |number| new_board[number] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def alternate_player(current_player)
  current_player = (current_player == "Player") ? "Computer" : "Player"
end

def place_piece!(brd, current_player)
  if current_player == "Player"
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  if !square
    square = 5 if empty_squares(brd).include?(5)
  end

  if !square
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

player_wins = 0
computer_wins = 0
tie_games = 0
user_first_move_selection = ''
if FIRST_MOVE == 'Player'
  current_player = 'Player'
elsif FIRST_MOVE == 'Computer'
  current_player = 'Computer'
else

  loop do
    puts "Who should begin? Type 'c' for Computer or 'p' for Player:"
    user_first_move_selection = gets.chomp
    break unless user_first_move_selection.empty? || \
                 user_first_move_selection != 'c' && \
                 user_first_move_selection != 'p'
    puts "Please enter a valid response."
  end
  current_player = if user_first_move_selection == 'c'
                     'Computer'
                   else
                     'Player'
                   end
end
loop do
  loop do
    board = intialize_board
    display_board(board)

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      if detect_winner(board) == "Player"
        player_wins += 1
      else
        computer_wins += 1
      end
    else
      prompt "It's a tie!"
      tie_games += 1
    end

    score_board_display(player_wins, computer_wins, tie_games)
    sleep(1.5)
    break if player_wins == 5 || computer_wins == 5
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good Bye!"
