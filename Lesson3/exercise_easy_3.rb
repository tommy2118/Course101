# Exercises: Easy 3
# Exercise #1
puts "\nExercise #1"
flintstones = %w{Fred Barney Wilma Betty BamBam Pebbles}

# Exercise #2
puts "\nExercise #2"
flintstones << "Dino"

# Exercise #3
puts "\nExercise #3"

flintstones = %w{Fred Barney Wilma Betty BamBam Pebbles}

flintstones.insert(0, "Dino", "Hoppy")
puts flintstones

# Exercise #4
puts "\nExercise #4"

advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.slice!(0..38)
puts advice

# Exercise #5
puts "\nExercise#5"

statement = "The Flintstones Rock!"

puts statement.count "t"

# Exercise #6
puts "\nExercise #6"

title = "Flintstone Family Members"
puts " " * 7 + title
puts title.center(40)
