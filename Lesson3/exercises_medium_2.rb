# Exercises - Medium 2
# Exercise #1
puts "\nExercise #1"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male"}
}
total = 0
munsters.each do |name, details|
  if details["gender"] == "male"
    total += details["age"]
  end
end
puts total

# Exercise #2
puts "\nExercise #2"

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}."
end

# Exercise #3
puts "\nExercise #3"

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Exercise #4
puts "\nExercise #4"

sentence = "Humpty Dumpty sat on a wall."

words = sentence.split(" ")
words.reverse!
reverse_sentence = words.join(" ")
puts reverse_sentence

# Exercise #5
puts "\nExercise #5"

puts 34

# Exercise #6
puts "\nExercise #6"

puts "The data got ransacked"

# Exercise #7
puts "\nExercise #7"

puts "paper"

# Exercise #8
puts "\nExercise #8"

puts "no"
