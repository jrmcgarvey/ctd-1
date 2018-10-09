require_relative "roshambo"
require "pry"

def game_start

  # continue_gameplay(rounds)
end

# def continue_gameplay(rounds)
#   draws = wins = losses = 0
#   choices = %w(rock paper scissors)
#   rounds.times do
#     player_choice = roshambo(choices)
#     ai_choice = ai_turn()
#     round_results(rounds, player_choice, choices, ai_choice, draws, wins, losses)
#   end
# end


def main
  rounds = Game.start
  game = Game.new(rounds)
  roshambo = Roshambo.new(game)
  Roshambo.play(roshambo)
end

main if __FILE__ == $PROGRAM_NAME
