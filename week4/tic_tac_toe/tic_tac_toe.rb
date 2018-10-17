# Controls the game play
class TicTacToe
    # initialize
    def initialize
        # set up the board
        @board = Board.new

        # set up the players
        @player_x = Player.new("Madame X", :x, @board)
        @player_o = Player.new("Mister O", :o, @board)

        # assign the starting player
        @current_player = @player_x
    end
    
    # play
    def play
        # loop infinitely
            # call the board rendering method
            # ask for coordinates from the current player
            # break the loop IF the game is over
            # switch players
    end

    # check_game_over
    def check_game_over
        # check_victory
        # check_draw
    end
        

    # check_victory
    def check_victory
        # IF board says current player's piece has
        # a winning_combination?
        # display a victory message
    end
       

    # check_draw
    def check_draw
         # IF Board says we've filled up
        # display a draw message
    end
      
    # switch_players
    def switch_players
        # PlayerX >> PlayerO or vice versa
        @current_player = @player_o if @current_player == @player_x
        @current_player = @player_x if @current_player == @player_o
   
    end
end