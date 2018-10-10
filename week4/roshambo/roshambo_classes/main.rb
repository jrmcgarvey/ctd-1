require_relative "game"
require_relative "roshambo"

def main
  rounds = Game.start
  game = Game.new(rounds)
  roshambo = Roshambo.new(game)
  Roshambo.play(roshambo)
end

main if __FILE__ == $PROGRAM_NAME
