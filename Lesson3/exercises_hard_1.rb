# Exercises - Hard 1
# Exercise #1
puts "\nExercise #1"

puts "The variable greeting will return nil."

# Exercise #2
puts "\nExercise #2"

puts "hi there"

# Exercises #3
puts "\nExercise #3"

puts "one, two, three"
puts "one, two, three"
puts "two, three, one"

# Exercises #4
puts "\nExercise #4"

require 'securerandom'

def create_UUID
  hex_numbers = []
  sections = [4, 2, 2, 2, 6]
  sections.each do |section|
    number = SecureRandom.hex(section)
    hex_numbers << number
  end
  uuid = hex_numbers.join("-")
  puts uuid
end
puts create_UUID

# Exercises #5
puts "\nExercise #5"

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size ==  4

  while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_a_number?(word)
  end

  true
end

