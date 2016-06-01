def prompt(message)
  puts "=> #{message}"
end

def not_positive_number?(number)
  number.empty? || number.to_f < 0
end

prompt("|------------------------------------|")
prompt("| Welcome to the Mortgage Calculator |")
prompt("|------------------------------------|")

loop do
  prompt("What is the loan amount?")

  amount = ''
  loop do
    amount = gets.chomp

    if not_positive_number?(amount)
      prompt("Must enter a positive number.")
    else
      break
    end
  end

  prompt("What is the interest rate?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = ''
  loop do
    interest_rate = gets.chomp

    if not_positive_number?(interest_rate)
      prompt("Must enter a positive number.")
    else
      break
    end
  end

  prompt("What is the loan duration (in years)?")

  years = ''
  loop do
    years = gets.chomp
    if years.empty? || years.to_i < 0
      prompt("Enter a valid number")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i * 12

  monthly_payment = amount.to_f * 
                    (monthly_interest_rate / 
                    (1 - (1 + monthly_interest_rate)**-months.to_i))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")

  prompt("Another calculation?")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Mortage Calculator!")
prompt("Good bye!")