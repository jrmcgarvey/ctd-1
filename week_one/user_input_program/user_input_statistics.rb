require 'pry'

def main
  # we need an array to store our data
  # how do we assign an array to a variable?
  int_array = []
  string_array = []

  loop do
    # continue to ask for a number
      puts 'Enter an input: '
      input = gets.chomp
      # challenge: how do I check that may input is an integer and not a string?
      if input.to_i.to_s == input || input.to_f.to_s == input
        int_array << input.to_f
      else
        string_array << input
      end
    break if input == '' # this will end the loop if the user input is blank
  end
  # output count
  puts "Count: #{int_array.count}" if int_array != []
  puts "Count: #{string_array.count - 1}" if string_array != []

  # output sum
  sum = 0
  int_array.each do |int|
    sum += int
  end
  puts "Sum: #{sum}" if int_array != []

  # output average
  puts "Average: #{sum / int_array.count}" if int_array != []

  puts "Your string inputs are: #{string_array.join(", ")}" if string_array != []

end

main if __FILE__ == $PROGRAM_NAME
