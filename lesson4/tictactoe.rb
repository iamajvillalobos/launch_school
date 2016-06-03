INITIALIZE_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def display_board(board)
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     +     +"
  puts ""
end

def player_place_piece(board)
  puts "Choose a square: (1-9)"
  square = gets.chomp.to_i
  board[square] = 'X'
end

board = initialize_board
display_board(board)

player_place_piece(board)
display_board(board)