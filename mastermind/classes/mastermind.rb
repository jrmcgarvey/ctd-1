require_relative "mm_game"

def main
 game = MmGame.new
 game.play
end

main if __FILE__ == $PROGRAM_NAME