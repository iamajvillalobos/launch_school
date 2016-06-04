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
def display_board(board, player_score, computer_score)
  system 'clear'
  puts "You're the #{PLAYER_MARKER}, Computer is #{COMPUTER_MARKER}."
  puts "Player: #{player_score} - Computer: #{computer_score}"
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
  square = empty_squares(board).sample
  board[square] = COMPUTER_MARKER
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

def detect_game_winner(player_score, computer_score)
  return 'Player' if player_score == 5
  return 'Computer' if computer_score == 5
  nil
end

def someone_won_round?(board)
  return true if detect_round_winner(board).is_a?(String)
  false
end

def someone_won_game?(player_score, computer_score)
  return true if detect_game_winner(player_score, computer_score).is_a?(String)
  false
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board

  loop do
    display_board(board, player_score, computer_score)

    player_add_piece!(board)
    break if someone_won_round?(board) || board_full?(board)

    computer_add_piece!(board)
    break if someone_won_round?(board) || board_full?(board)
  end

  if someone_won_round?(board)
    player_score += 1 if detect_round_winner(board) == 'Player'
    computer_score += 1 if detect_round_winner(board) == 'Computer'
  else
    puts "It's a tie!"
  end

  display_board(board, player_score, computer_score)

  if someone_won_game?(player_score, computer_score)
    puts "Game Over! #{detect_game_winner(player_score, computer_score)} won!"
    break
  else
    puts 'Do you want to play again? (y or n)'
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

puts 'Thank you for playing!'
