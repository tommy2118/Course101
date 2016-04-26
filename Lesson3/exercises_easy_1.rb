#Exercises - Easy 1

# Exercise #1
puts "\nExercise #1"

puts "1, 2, 2, 3"

# Exercise #2
puts "\nExercise #2"

puts "In Ruby ! and ? are used to help express the meaning of a method."
puts "! usually indicates that the method will mutate the caller and ?"
puts "implies the method will return a boolean."
puts "It is important to remember that ! and ? are just part of the method"
puts "names and they don't really mean anything to Ruby."
puts ""
puts "!= is the same as saying not equal"
puts ""
puts "!foo means that it will return the inverse of whatever you are calling."
puts ""
puts "!!foo will turn an object into its boolean equivalent."

# Exercise #3
puts "\nExercise #3"

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')

puts advice

# Exercise #4
puts "\nExercise #4"

puts "delete_at() will remove the item in the array at the index given as an argument"
puts "delete() will delete the content that is given as an argument where ever it is found in the array"

# Exercise #5
puts "\nExercise #5"

puts (10..100).cover?(42)

# Exercise #6
puts "\nExercise #6"

famous_words = "seven years ago..."

puts "Four score and " + famous_words

puts famous_words.prepend("Four score and ")

# Exercise #7
puts "\nExercise #7"

puts 42

# Exercise #8
puts "\nExercise #8"
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones.flatten!

# Exercise #9
puts "\nExercise #9"

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")

# Exercise #10
puts "\nExercise #10"

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
p flintstones_hash
