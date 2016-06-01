munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def add_age_group(hash)
  hash.each_key do |key|
    age = hash[key]['age']
    case age
    when 0...17
      hash[key]["age_group"] = "kid"
    when 18...64
      hash[key]["age_group"] = "adult"
    else
      hash[key]["age_group"] = "senior"
    end
  end
end

results = add_age_group(munsters)
