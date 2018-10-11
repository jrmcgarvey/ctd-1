# Controls the game play
class TicTacToe
    # initialize
        # set up the board
        # set up the players
        # assign the starting player

    # play
        # loop infinitely
            # call the board rendering method
            # ask for coordinates from the current player
            # break the loop IF the game is over
            # switch players

    # check_game_over
        # check_victory
        # check_draw

    # check_victory
        # IF board says current player's piece has
        # a winning_combination?
            # display a victory message

    # check_draw
        # IF Board says we've filled up
            # display a draw message


    # switch_players
        # PlayerX >> PlayerO or vice versa
    def initialize
        @board=Board.new
        puts "Player 1, you will be X.  What is your name?"
        name=gets.chomp
        @player1=Player.new(name,"X",@board)
        puts "Player 2, you will by O.  What is your name?"
        name=gets.chomp
        @player2=Player.new(name,"O",@board)
    end
    def play
        player=@player1
        while true
            @board.render
            player.ask_for_coordinates
            state=@board.winning_combination(player.piece)
            case state
                when :win
                    @board.render
                    puts "#{player.name}, you win!"
                    break
                when :draw
                    @board.render
                    puts "Aww, a cat's game."
                    break
                else
                    player= player==@player1 ? @player2 : @player1
                    
            end    
        end
    end
end