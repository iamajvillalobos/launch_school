# ask the user for two numbers
# ask the user an operator
# perform the operation on the two numbers
# output the result

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  number.to_i.to_s == number
end

def valid_choice?(choice)
  choices = %w(1 2 3 4)
  choices.include?(choice)
end

prompt("-----------------------------")
prompt("| Welcome to the Calculator |")
prompt("-----------------------------")

prompt("Enter your name:")
user_name = gets.chomp
prompt("Welcome #{user_name}!")

loop do
  
  first_number = ''
  loop do
    prompt("What's the first number?")
    first_number = gets.chomp
    if valid_number?(first_number)
      break
    else
      prompt("There seems to be a problem with your first_number")
    end
  end

  second_number = ''
  loop do
    prompt("What's the second number?")
    second_number = gets.chomp
    if valid_number?(second_number)
      break
    else
      prompt("There seems to be a problem with your second_number")
    end
  end

  prompt("What operation do you want to perform?")
  prompt("1) Add")
  prompt("2) Subtract")
  prompt("3) Multiply")
  prompt("4) Divide")

  operator = ''
  loop do
    operator = gets.chomp
    if valid_choice?(operator)
      break
    else
      prompt("You input an option not in the allowed operations")
    end
  end

  result = case operator
           when '1'
             first_number.to_i + second_number.to_i
           when '2'
             first_number.to_i - second_number.to_i
           when '3'
             first_number.to_i * second_number.to_i
           when '4'
             first_number.to_f / second_number.to_f
           end

  prompt("------------------------")
  prompt("The result is: #{result}")
  prompt("------------------------")

  prompt("Do you want to calculate again?")
  break unless gets.chomp.start_with?('y')
end
