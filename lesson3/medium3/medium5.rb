def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def valid_color?(color)
  color == "blue" || color == "green"
end

p color_valid("orange")
p valid_color?("orange")