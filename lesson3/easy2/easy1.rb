ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 

ages.has_value?("Spot")
ages.value?("Spot")
ages.fetch("Spot")

ages.key?("Spot")
ages.include?("Spot")
ages.member?("Spot")