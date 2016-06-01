def titleize!(phrase)
  # words = phrase.split(' ')
  # words.each do |word|
  #   word.capitalize!
  # end
  # words.join(' ')

  phrase.split.map { |word| word.capitalize }.join(' ')
end

p titleize!("what are you looking at")