# Maintains game board state
class Board
    # initialize board
        # set up blank data structure
    def initialize
        @board=["   ","   ","   "]
    end

    # render
        # loop through data structure
            # display an existing marker if any, else blank
    def render #make it pretty, requires a little more code
        puts "#{@board[0][0]}|#{@board[0][1]}|#{@board[0][2]}"
        puts "-" * 5
        puts "#{@board[1][0]}|#{@board[1][1]}|#{@board[1][2]}"
        puts "-" * 5
        puts "#{@board[2][0]}|#{@board[2][1]}|#{@board[2][2]}"
    end   
     
    # add_piece
        # IF piece_location_valid?
            # place piece
        # ELSE
            # display error message
    def add_piece(coordinates,piece)

    # piece_location_valid?
        # Is the placement within_valid_coordinates?
        # Are the piece coordinates_available?
        if coordinates[0] < 0 || coordinates[0] > 2 || coordinates[1]<0 || coordinates[1]>2
            puts "Those are not valid coordinates, which must be a pair, each from 0 to 2." 
            return false
        end
        if @board[coordinates[1]][coordinates[0]] != " "
            puts "That spot is taken."
            return false
        end
        @board[coordinates[1]][coordinates[0]]=piece
        true
    end
    
    def horizontals
        @board
    end
    
    def verticals
        a=["   ","   ","   "]
        @board.each_with_index do |row,i|
            for j in 0..2
                a[j][i]=row[j]
            end
        end
        return a
    end
    
    def diagonals
        a=["   ","   "]
        @board.each_with_index do |row,i|
            a[0][i]=row[i]
            a[1][i]=row[2-i]
        end
        a
    end
    
    def winning_combination(piece)
     #   puts @board.to_s
        combo=piece * 3
        r=horizontals
        r.each do |val|
            return :win if val==combo
        end
        r=verticals
     #   puts r.to_s
        r.each do |val|
            return :win if val==combo
        end
        r=diagonals
    #    puts r.to_s
        r.each do |val|
            return :win if val==combo
        end
        @board.each do |val|
            return :play if val.include?(" ") # still room
        end
        :draw
    end
        
            

    # within_valid_coordinates?
        # UNLESS piece coords are in the acceptible range
            # display an error message

    # coordinates_available?
        # UNLESS piece coords are not occupied
            # display error message

    # winning_combination?
        # is there a winning_diagonal?
        # or winning_vertical? 
        # or winning_horizontal? for that piece?

    # winning_diagonal?
        # check if specified piece has a triplet across diagonals

    # winning_vertical?
        # check if specified piece has a triplet across verticals

    # winning_horizontal?
        # check if specified piece has a triplet across horizontals

    # diagonals
        # return the diagonal pieces

    # verticals
        # return the vertical pieces

    # horizontals
        # return the horizontal pieces

    # full?
        # does every square contain a piece?
end
