munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_key do |person|
  puts "#{person.capitalize} is a #{munsters[person]['age']} year old #{munsters[person]['gender']}." 
end

puts "-" * 25

munsters.each_pair do |person, details|
  puts "#{person} is a #{details['age']} year old #{details['gender']}."
end