# ask the user for two numbers
# ask the user an operator
# perform the operation on the two numbers
# output the result

require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

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
prompt("| #{MESSAGES['welcome_message']} |")
prompt("-----------------------------")

prompt("Enter your name:")
user_name = gets.chomp
prompt("Welcome #{user_name}!")

loop do
  
  first_number = ''
  loop do
    prompt(MESSAGES['first_number_prompt'])
    first_number = gets.chomp
    if valid_number?(first_number)
      break
    else
      prompt(MESSAGES['first_number_error'])
    end
  end

  second_number = ''
  loop do
    prompt(MESSAGES['second_number_prompt'])
    second_number = gets.chomp
    if valid_number?(second_number)
      break
    else
      prompt(MESSAGES['second_number_error'])
    end
  end

  prompt(MESSAGES['operation_prompt'])
  prompt(MESSAGES['operation_add'])
  prompt(MESSAGES['operation_subtract'])
  prompt(MESSAGES['operation_multiply'])
  prompt(MESSAGES['operation_divide'])

  operator = ''
  loop do
    operator = gets.chomp
    if valid_choice?(operator)
      break
    else
      prompt(MESSAGES['operation_error'])
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

  prompt(MESSAGES['try_again_prompt'])
  break unless gets.chomp.start_with?('y')
end

prompt("----------------------------------")
prompt("| #{MESSAGES['goodbye_message']} |")
prompt("----------------------------------")
