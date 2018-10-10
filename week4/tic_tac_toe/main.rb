require_relative "tic_tac_toe"
require_relative "board"
require_relative "player"

def main
 game = TicTacToe.new
 game.play
end

main if __FILE__ == $PROGRAM_NAME