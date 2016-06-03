require 'pry'

INITIALIZE_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def display_board(board)
  system 'clear'
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

def detect_winner(board)
  winning_lines = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

  winning_lines.each do |lines|
    if board[lines[0]] == 'X' &&
       board[lines[1]] == 'X' &&
       board[lines[2]] == 'X'
      return 'Player'
    elsif lines[0] == 'O' && lines[1] == 'O' && lines[2] == 'O'
      return 'Computer'
    end
  end

  nil
end

def someone_won?(board)
  !!detect_winner(board)
end

board = initialize_board
display_board(board)

loop do
  player_add_piece!(board)
  computer_add_piece!(board)
  display_board(board)
  break if someone_won?(board) || board_full?(board)
end

if someone_won?(board)
  puts "#{detect_winner(board)} won!"
else
  puts "It's a tie!"
end
