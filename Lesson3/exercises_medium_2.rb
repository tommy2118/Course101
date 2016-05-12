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
