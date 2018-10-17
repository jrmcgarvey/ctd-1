require_relative "board"

#test 1

board=Board.new
board.render
=begin
#test 2

open=board.coordinates_available?([0,0])
puts " 0,0 is available" if open
board.add_piece("x",[0,0])
board.add_piece("o",[1,0])
board.render
open=board.coordinates_available?([0,0])
puts "now 0,0 is taken" if !open

#test 3
rows=board.rows
rows.each { |row| puts row.to_s}

#test 4
columns=board.columns
columns.each { |column| puts column.to_s}

#test 5
diagonals=board.diagonals
diagonals.each { |diagonal| puts diagonal.to_s}

#test 6
board=Board.new   #start with a clean board

w=board.winning_combination?
puts "no winning combination yet" if !w
board.add_piece("x",[0,0])
board.add_piece("x",[0,1])
board.add_piece("x",[0,2])
w=board.winning_combination?
 
puts "found a winning combination on a column" if w

board=Board.new   #start with a clean board
board.add_piece("o",[0,1])
board.add_piece("o",[1,1])
board.add_piece("o",[2,1])
w=board.winning_combination?
 
puts "found a winning combination on a row" if w

board=Board.new   #start with a clean board
board.add_piece("x",[0,2])
board.add_piece("x",[1,1])
board.add_piece("x",[2,0])
w=board.winning_combination?
 
puts "found a winning combination on a diagonal" if w

# test 7
board=Board.new
for i in 0..2 do
    for j in 0..2 do
        board.add_piece("x",[i,j]) #fill up the board
    end
end

f=board.full?

puts "found a full board" if f
=end