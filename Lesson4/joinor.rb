def joinor(array, delimiter = ', ', joining_word = "or")
  joined_string = ''
  count = 0
  array.each do |element|
    if count == array.count - 1
      joined_string << "#{joining_word} #{element}"
    else
      joined_string << "#{element}#{delimiter}"
      count += 1
    end
  end
  joined_string
end

puts joinor([1, 2, 3])
puts joinor([1, 2, 3], "; ")
puts joinor([1, 2, 3], ", ", "and")
