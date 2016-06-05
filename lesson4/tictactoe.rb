require 'pry'

INITIALIZE_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
].freeze

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(board, scores)
  system 'clear'
  puts "You're the #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}."
  puts "Player: #{scores[:player]} - Computer: #{scores[:computer]}"
  puts ''
  puts '------+-----+------'
  puts '|     |     |     |'
  puts "|  #{board[1]}  |  #{board[2]}  |  #{board[3]}  |"
  puts '|     |     |     |'
  puts '------+-----+------'
  puts '|     |     |     |'
  puts "|  #{board[4]}  |  #{board[5]}  |  #{board[6]}  |"
  puts '|     |     |     |'
  puts '------+-----+------'
  puts '|     |     |     |'
  puts "|  #{board[7]}  |  #{board[8]}  |  #{board[9]}  |"
  puts '|     |     |     |'
  puts '------+-----+------'
  puts ''
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIALIZE_MARKER }
end

def player_add_piece!(board)
  square = ''
  loop do
    puts "Choose a square: (#{empty_squares(board).join(', ')})"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    puts 'Invalid option. Please select from valid choices.'
  end

  board[square] = PLAYER_MARKER
end

def computer_add_piece!(board)
  square = computer_choice(board)
  board[square] = COMPUTER_MARKER
end

def computer_choice(board)
  winning_square(board) ||
    losing_square(board) ||
    middle_or_random_square(board)
end

def middle_or_random_square(board)
  square = if board[5] == ' '
             5
           else
             empty_squares(board).sample
           end
  square
end

def winning_square(board)
  square = nil

  WINNING_LINES.each do |line|
    square = find_risk_at_square(line, board, COMPUTER_MARKER)
    break if square
  end

  square
end

def losing_square(board)
  square = nil

  WINNING_LINES.each do |line|
    square = find_risk_at_square(line, board, PLAYER_MARKER)
    break if square
  end

  square
end

def board_full?(board)
  empty_squares(board).empty?
end

def detect_round_winner(board)
  WINNING_LINES.each do |lines|
    return 'Player' if board.values_at(*lines).count(PLAYER_MARKER) == 3
    return 'Computer' if board.values_at(*lines).count(COMPUTER_MARKER) == 3
  end
  nil
end

def detect_game_winner(scores)
  return 'Player' if scores[:player] == 5
  return 'Computer' if scores[:computer] == 5
  nil
end

def someone_won_round?(board)
  detect_round_winner(board).is_a?(String)
end

def someone_won_game?(scores)
  detect_game_winner(scores).is_a?(String)
end

def find_risk_at_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    blank_squares = board.select do |k, v|
      line.include?(k) && v == INITIALIZE_MARKER
    end
    blank_squares.keys.first
  end
end

scores = { player: 0, computer: 0 }

loop do
  board = initialize_board

  loop do
    display_board(board, scores)

    player_add_piece!(board)
    break if someone_won_round?(board) || board_full?(board)

    computer_add_piece!(board)
    break if someone_won_round?(board) || board_full?(board)
  end

  if someone_won_round?(board)
    scores[:player] += 1 if detect_round_winner(board) == 'Player'
    scores[:computer] += 1 if detect_round_winner(board) == 'Computer'
  else
    puts "It's a tie!"
  end

  display_board(board, scores)

  if someone_won_game?(scores)
    puts "Game Over! #{detect_game_winner(scores)} won!"
    break
  else
    puts 'Do you want to play again? (y or n)'
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

puts 'Thank you for playing!'
