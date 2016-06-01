ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject { |k,v| v > 100 }
p ages.keep_if { |_, age| age < 100 }