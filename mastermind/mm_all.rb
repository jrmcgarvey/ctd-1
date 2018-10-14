class Board
    Colors=[:black,:white,:red,:yellow,:blue,:green]
    def initialize
        @secret=Array.new(4){Colors[rand(6)]}
    end
    def evaluate_guess(guess)
        s1=@secret.clone
        g1=guess.clone
        right=near=0
        g2=g1
        g1.each_with_index do |val, i|
            if val==s1[i] 
                right+=1
                g2[i] = nil
                s1[i]= nil
            end
        end
        g2.each do |val|
            if val != nil
                i=s1.find_index(val)
                if i!=nil
                    near+=1
                    s1[i]=nil
                end
            end
        end
        return [right,near]
    end
end
class MyBoard < Board
    def initialize(secret)
        @secret=secret
    end
end
class Player
    def collect_guess
        a=Array.new()
        loop do
            puts "Enter four colors separated by commas.  Your choices are black, white, red, yellow, blue, and green."
            s=gets.chomp
            a=s.split(",")
            if a.length!= 4 
                puts "The wrong number of values was entered."
                next
            end    
            a=a.map {|val| val.strip.to_sym }
            bad=false
            a.each do |v2|
                if !Board::Colors.include?(v2)
                    puts v2
                    puts "An invalid color was entered."
                    bad=true
                end
            end
            break if !bad
        end
        return a
    end
end

class Machine
    def collect_guess
        return Array.new(4) {Board::Colors[rand(6)]}
    end
end

player1=Player.new
ans=1
loop do
    puts "Enter 1 if you want to set the secret or 2 if you want to be the guesser."
    ans=gets.chomp.strip
    break if ans=='1' || ans=='2' 
end
if ans==2
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
        puts guess.to_s + " has " + matches[0].to_s + " correct colors in the right spot and " + matches[1].to_s + " correct colors but in the wrong spot."
        if matches[0]==4  
            puts "The machine wins!"
            win=true
            break
        end
    end    
    
    puts " The machine is out of guesses.  It loses, too bad." if !win
end    
        
            
    
    