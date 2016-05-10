# Exercises: Medium 1
# Exercise #1
puts "\nExercise #1"

10.times { |number| puts (" " * number) + "The Flintstones Rock!" }

#Exercise #2
puts "\nExercise #2"

statement = "The Flintstones Rock"
p char_array = statement.chars
char_hash = {}
char_array.each do |character|
  unless char_hash.has_key?(character)
    char_hash[character] = (1)
  else
    char_hash[character] = (char_hash.fetch(character) + 1)
  end
end
puts char_hash

# Exercise #3
puts "\nExercise #3"

puts "the value of 40 + 2 is #{40 + 2}"

# Exercise #4
puts "\nExercise #4"

puts "Since iteration is happening on the original array, the block is mutating\n
the array.  In the first example you are removing the element in the second\n
position and in the second example your are removing the one from the end"

# Exercise #5
puts "\nExercise #5"

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end
puts factors(-100)
puts factors(0)
puts factors(20)
# Exercise #6
puts "\nExercise #6"

puts "The first example will mutate the input argument 'buffer' the second \n
will not."

# Exercise #7
puts "\nExercise #7"

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15)
puts "result is #{result}"

# Exercise #8
puts "\nExercise #8"

def titleize(string)
  words = string.split(" ")
  words.map { |word| word.capitalize! }
  words.join(" ")
end

puts titleize("hello my name is tommy")
# Exercise #9
puts "\nExercise #9"

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when 0...18
    details["age_group"] = "kid"
  when 18...65
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end

puts munsters
