class Board 
    def initialize
        @board=[["_","_","_"],["_","_","_"],["_","_","_"]]
        # OR
        # @board=Array.new(3) { ["_","_","_"] }
    end 
    
    def render
        @board.each do |row|
            row.each {|entry|  print entry }
            puts
        end
    end
    
    def coordinates_available?(c)
        return true if @board[c[1],c[0]]=="_"
    end
    
    def add_piece(piece,c)
        @board[c[1]][c[0]]=piece
    end
    
    def rows
        return @board
    end
    
    def columns
        cols=Array.new(3) { Array.new(3) {"_"}}
        for i in 0..2 do
            for j in 0..2 do
                cols[i][j]=@board[j][i]
            end
        end
        return cols
    end
    
    def diagonals
        diags=Array.new(2) { Array.new(3) {"_"}}
        diags[0][0]=@board[0][0]
        diags[0][1]=@board[1][1]
        diags[0][2]=@board[2][2]
        diags[1][0]=@board[0][2]
        diags[1][1]=@board[1][1]
        diags[1][2]=@board[2][0]
        return diags
    end
    
    def find_winner(my_array)
        my_array.each do |row|
            return true if row[0] != "_" && row[0] == row[1] && row[0] == row[2]
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
            return false if row.include?("_")
        end
        return true
    end
end