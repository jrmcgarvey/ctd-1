class Board 
    def initialize
     # initialize board
        # set up blank data structure
        @board = [[nil, nil, nil], 
                  [nil, nil, nil], 
                  [nil, nil, nil]]
    end
    # render
    def render
        # loop through data structure
        @board.each do |row|
            row.each do |column|
                # display an existing marker if any, else blank
                if column.nil? # if the column value is empty 
                    print "#" # print an underscore value to display the available spots on the board
                else
                    print column.to_s
                end
            end
            puts
        end
    end

    def coordinates_available?(c)
        return true if @board[c[1]][c[0]]==nil
    end
    
    def add_piece(piece,c)
        @board[c[1]][c[0]]=piece
    end
    
    def rows
        return @board
    end
    
    def columns
        cols=Array.new(3) { Array.new(3)}
        for i in 0..2 do
            for j in 0..2 do
                cols[i][j]=@board[j][i]
            end
        end
        return cols
    end
    
    def diagonals
        return [[@board[0][0],@board[1][1],@board[2][2]],[@board[0][2],@board[1][1],@board[2][0]]]
    end
    
    def find_winner(my_array)
        my_array.each do |row|
            return true if row[0] != nil && row[0] == row[1] && row[0] == row[2]
        end
        return false
    end

    def winning_combination?
        return true if find_winner(self.rows)
        return true if find_winner(self.columns)
        return true if find_winner(self.diagonals)
        return false
    end
    
    def full?
        @board.each do |row|
            return false if row.include?(nil)
        end
        return true
    end
end