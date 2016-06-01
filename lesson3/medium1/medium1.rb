string = 'The Flintstones are back!'

10.times { |s| puts string.rjust(string.length + s ) }
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }