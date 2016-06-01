VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(player1, player2)
  player1 == 'rock' && player2 == 'scissors' ||
    player1 == 'paper' && player2 == 'rock' ||
    player1 == 'scissors' && player2 == 'paper'
end

def display_result(player_choice, computer_choice)
  if win?(player_choice, computer_choice)
    prompt("YOU WON!")
  elsif win?(computer_choice, player_choice)
    prompt("YOU LOSE!")
  else
    prompt("IT'S A TIE!")
  end
end

def display_choices(player, computer)
  prompt("----------------------------")
  prompt("You choose: #{player}")
  prompt("Computer choose: #{computer}")
  prompt("----------------------------")
end

loop do
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")

  player_choice = ''
  loop do
    player_choice = gets.chomp

    if VALID_CHOICES.include?(player_choice)
      break
    else
      prompt("You must choose a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  display_choices(player_choice, computer_choice)
  display_result(player_choice, computer_choice)

  prompt("---------------")
  prompt("Continue? (y/n)")
  prompt("---------------")

  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt("Thank for playing rock paper and scissors!")

