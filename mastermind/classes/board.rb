class Board
    Colors=[:black,:white,:red,:yellow,:blue,:green]
    def initialize
        @secret=Array.new(4){Colors[rand(6)]}
    end
    
    def evaluate_guess(guess)
        return Board.check_guess(guess,@secret)
    end
    
    def self.check_guess(guess,state)
        s1=state.clone
        g1=guess.clone
        right=near=0
        g2=g1.clone
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
