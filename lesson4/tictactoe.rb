INITIALIZE_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def display_board(board)
  system 'clear'
  puts ""
  puts "------+-----+------"
  puts "|     |     |     |"
  puts "|  #{board[1]}  |  #{board[2]}  |  #{board[3]}  |"
  puts "|     |     |     |"
  puts "------+-----+------"
  puts "|     |     |     |"
  puts "|  #{board[4]}  |  #{board[5]}  |  #{board[6]}  |"
  puts "|     |     |     |"
  puts "------+-----+------"
  puts "|     |     |     |"
  puts "|  #{board[7]}  |  #{board[8]}  |  #{board[9]}  |"
  puts "|     |     |     |"
  puts "------+-----+------"
  puts ""
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
    puts "Invalid option. Please select from valid choices."
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

def someone_won?(board)
  false
end

board = initialize_board
display_board(board)

loop do
  player_add_piece!(board)
  computer_add_piece!(board)
  display_board(board)
  break if someone_won?(board) || board_full?(board)
end

display_board(board)