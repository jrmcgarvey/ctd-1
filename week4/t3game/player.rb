# Manages all player-related functionality
class Player
    # initialize
        # Set marker type (e.g. X or O)

    # get_coordinates
        # loop infinitely
            # ask_for_coordinates
            # IF validate_coordinates_format is true
                # IF piece can be placed on Board
                    # break the loop


    # ask_for_coordinates
        # Display message asking for coordinates
        # pull coordinates from command line

    # validate_coordinates_format
        # UNLESS coordinates are in the proper format
            # display error message
    attr_accessor :piece,:name
    def initialize(name,piece,board)
        @name=name
        @piece=piece
        @board=board
    end
    def ask_for_coordinates
        coordinates=[]
        while true
            puts "#{@name}, where do you want to put your #{@piece}? Please give two numbers, each from 0 to 2, separated by a comma.  These are the coordinates of your move."
            s=gets.chomp
            sa=s.split(",")
            if sa.length==2
                coordinates[0]=sa[0].to_i
                coordinates[1]=sa[1].to_i
                break if @board.add_piece(coordinates,@piece)
            else
                puts "That was invalid input.  Please try again."
            end
        end
    end 
end
