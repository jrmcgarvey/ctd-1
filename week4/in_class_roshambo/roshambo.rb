# array of choices
choices = ["rock", "paper", "scissors"]

# puts choices for game
puts "Rock, Paper, Scissors"

# set game variables draws, wins, losses
draws = 0
wins = 0
losses = 0


# loop (set a condition for end game, maybe repeat 5 times)
5.times do
    puts '<----------------- Rock, Paper, Scissors, Shoot: ----------------->'
    # user_choice
    user_choice = gets.chomp.downcase
    ai_choice = rand(3) # choice a number 0, 1 or 2
    # puts user_choice and ai_choice
    puts "You chose #{user_choice} and the AI chose #{choices[ai_choice]}"
    
    if user_choice == choices[ai_choice]
        puts '---->draw'
        draws += 1
    elsif user_choice == choices[ai_choice - 1]
        puts '---->Computer wins'
        losses += 1
    else
        puts '---->You win'
        wins += 1
  end
end

# output statistics
puts "wins = #{wins}\nlosses = #{losses}\ndraw = #{draws}"
if wins > losses
  puts "Great Job! You're a Winner!"
elsif wins < losses
  puts 'Game Over. You Lose.'
else
  puts 'Draw.'
end
