statement = "The Flintstones Rock"
frequency_hash = {}

statement_array = statement.delete(' ').split('')
statement_array.each do |letter|
  frequency_hash["#{letter}"] = statement_array.count(letter)
end

p frequency_hash

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

p result