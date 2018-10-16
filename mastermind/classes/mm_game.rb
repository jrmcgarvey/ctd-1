require_relative "board"
require_relative "player"
require_relative "myboard"
require_relative "machine"

class MmGame
    def play
        player1=Player.new
        ans=1
        loop do
            puts "Enter 1 if you want to set the secret or 2 if you want to be the guesser."
            ans=gets.chomp.strip
            break if ans=='1' || ans=='2' 
        end
        if ans=="2"
            board=Board.new
            win=false
            12.times do
                a=player1.collect_guess
                matches=board.evaluate_guess(a)
                puts a.to_s + " has " + matches[0].to_s + " correct colors in the right spot and " + matches[1].to_s + " correct colors but in the wrong spot."
                if matches[0]==4  
                    puts "You win!"
                    win=true
                    break
                end
            end    
            
            puts " You are out of guesses.  You lose, too bad." if !win
        else
            a=player1.collect_guess
            my_board=MyBoard.new(a)
            machine=Machine.new
            win=false
            12.times do
                guess=machine.collect_guess
                matches=my_board.evaluate_guess(guess)
                machine.tell_machine(guess,matches)
                puts guess.to_s + " has " + matches[0].to_s + " correct colors in the right spot and " + matches[1].to_s + " correct colors but in the wrong spot."
                if matches[0]==4  
                    puts "The machine wins!"
                    win=true
                    break
                end
            end    
            
            puts " The machine is out of guesses.  It loses, too bad." if !win
        end    
    end
end
            
    
    