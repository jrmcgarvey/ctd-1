require_relative "roshambo"
require 'pry'

def main
  rounds = Game.start
  binding.pry
  game = Game.new(rounds)
  binding.pry
  roshambo = Roshambo.new(game)
  binding.pry
  Roshambo.play(roshambo)
end

main if __FILE__ == $PROGRAM_NAME
