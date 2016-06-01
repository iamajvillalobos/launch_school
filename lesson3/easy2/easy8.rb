flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  p index if name.start_with?('Be')
end

flintstones.index { |name| name[0, 2] == 'Be' }