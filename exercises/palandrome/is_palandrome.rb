def is_palindrome?(user_input)
  user_input == user_input.reverse
end

def ask_for_input
  puts 'Please enter a word, phrase, or multiple sentences: '
  user_input = gets.chomp.downcase.gsub(/[^0-9A-Za-z]/, '')
  exit if user_input == ''
  check_input(user_input)
end

def check_input(user_input)
  if is_palindrome?(user_input)
    puts "#{user_input} IS a Palindrome!"
  else
    puts "#{user_input} is NOT a Palindrome!"
  end
  ask_for_input
end

def main
  ask_for_input
end

main if __FILE__ == $PROGRAM_NAME