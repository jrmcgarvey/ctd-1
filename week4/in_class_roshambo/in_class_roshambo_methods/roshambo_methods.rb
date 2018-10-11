def play_game(choices, draws, losses, wins)
    user_choice = gets.chomp.downcase
    ai_choice = rand(3) # choice a number 0, 1 or 2
    puts "You chose #{user_choice} and the AI chose #{choices[ai_choice]}"
    end_game(losses, wins, draws, choices, user_choice, ai_choice)
end

def end_game(losses, wins, draws, choices, user_choice, ai_choice)
    if user_choice == choices[ai_choice]
        draws += 1
        puts "Draw: #{draw}"

    elsif user_choice == choices[ai_choice - 1]
        losses += 1
        puts "Loss: #{losses}"
    else
        wins += 1
        puts "Win: #{wins}"
  end
  play_again()
end

def play_game()
    puts "Play agian?"
end

def main
    choices = ["rock", "paper", "scissors"]
    puts "Rock, Paper, Scissors"
    draws = losses = wins = 0
    play_game(choices, draws, losses, wins) # method call
end

main if __FILE__ == $PROGRAM_NAME
