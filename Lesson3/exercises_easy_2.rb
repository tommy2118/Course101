# Exercises - Easy 2
# Exercise #1
puts "\nExercise #1"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.key?("Spot")
puts ages.include?("Spot")
puts ages.member?("Spot")

# Exercise #2
puts "\nExercise #2"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.inject(:+)

# Exercise #3
puts "\nExercise #3"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.keep_if { |_,age| age < 100 }

# Exercise #4
puts "\nExercise #4"

munsters_description = "The Munsters are creepy in a good way."

puts munsters_description.capitalize!
puts munsters_description.swapcase!
puts munsters_description.downcase!
puts munsters_description.upcase!

# Exercise #5
puts "\nExercise #5"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }

additional_ages = { "Marilyn" => 22, "Spot" => 237 }
puts ages.merge!(additional_ages)

# Exercise #6
puts "\nExercise #6"

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
puts ages.values.min

# Exercise #7
puts "\nExercise #7"

advice = "Few things in life are as important as house training your pet dinosaur."
p advice.match("Dino")
p advice.match("Few")

# Exercise #8
puts "\nExercise #8"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.index { |name| name[0, 2] == "Be" }

# Exercise #9
puts "\nExercise #9"

flintstones.map! do |name|
  name[0, 3]
end
puts flintstones

# Exercise #10
puts "\nExercise #10"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.map! { |name| name[0, 3] }
