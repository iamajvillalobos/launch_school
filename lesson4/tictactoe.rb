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

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIALIZE_MARKER }
end

def player_add_piece!(board)
  square = ''
  loop do
    puts "Choose a square (1 - 9)"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    puts "Invalid option. Please select from valid choices."
  end

  board[square] = PLAYER_MARKER
end

board = initialize_board
display_board(board)

player_add_piece!(board)
display_board(board)