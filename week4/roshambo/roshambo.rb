choices = %w(rock paper scissors)

puts 'Rock, paper or scissors'
draws = wins = losses = 0

5.times do
  puts '<----------------- Rock, Paper, Scissors, Shoot: ----------------->'
  human_choice = gets.chomp.downcase

  computer_choice = rand(3)

  puts "You chose #{human_choice}, computer choose #{choices[computer_choice]}"

  if human_choice == choices[computer_choice]
    puts '---->draw'
    draws += 1
  elsif human_choice == choices[computer_choice - 1]
    puts '---->Computer wins'
    losses += 1
  else
    puts '---->You win'
    wins += 1
  end
end

puts "wins = #{wins}\nlosses = #{losses}\ndraw = #{draws}"
if wins > losses
  puts "Great Job! You're a Winner!"
elsif wins < losses
  puts 'Game Over. You Lose.'
else
  puts 'Draw.'
end
