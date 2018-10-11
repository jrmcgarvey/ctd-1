# Manages all player-related functionality
class Player
    attr_accessor :name, :piece


    # initialize
    def initialize(name = "Mystery_Player", piece, board)
        # Set marker type (e.g. X or O)
        raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
        @name = name
        @piece = piece
        @board = board
    end

    # get_coordinates
    def get_coordinates
        # loop infinitely
            # ask_for_coordinates
            # IF validate_coordinates_format is true
                # IF piece can be placed on Board
                    # break the loop
    end

    # ask_for_coordinates
    def ask_for_coordinates
        # Display message asking for coordinates
        # pull coordinates from command line
    end

    # validate_coordinates_format
    def validate_coordinates_format()
        # UNLESS coordinates are in the proper format
            # display error message
    end
end
