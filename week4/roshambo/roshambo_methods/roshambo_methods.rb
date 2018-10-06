require "pry"

def game_start
  puts "Let's play Rock, Paper, Scissors!"
  print "How many rounds would you like to play? "
  rounds = gets.chomp.to_i
  continue_gameplay(rounds)
end

def continue_gameplay(rounds)
  draws = wins = losses = 0
  choices = %w(rock paper scissors)
  rounds.times do
    player_choice = roshambo(choices)
    ai_choice = ai_turn()
    round_results(rounds, player_choice, choices, ai_choice, draws, wins, losses)
  end
end

def roshambo(choices)
  puts '<----------------- Rock, Paper, Scissors, Shoot: ----------------->'
  player_choice = gets.chomp.downcase
  verify_player_choice(player_choice, choices)
end

def verify_player_choice(player_choice, choices)
  if choices.include?(player_choice)
    player_choice = player_choice
  else
    roshambo(choices)
  end
end

def ai_turn
  ai_choice = rand(3)
end

def round_results(rounds, player_choice, choices, ai_choice, draws, wins, losses)
  puts "You chose #{player_choice}, AI choose #{choices[ai_choice]}"

  if player_choice == choices[ai_choice]
    draws = draw(draws)
  elsif player_choice == choices[ai_choice - 1]
    losses = loss(losses)
  else
    wins = win(wins)
  end
end

def win(wins)
  puts '---->You win'
  wins += 1
end

def loss(losses)
  puts '---->Computer wins'
  losses += 1
end

def draw(draws)
  puts '---->draw'
  draws += 1
end

def main
  game_start
end

main if __FILE__ == $PROGRAM_NAME
