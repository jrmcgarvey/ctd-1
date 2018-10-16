require_relative "board"

class Machine
    def initialize
        @guesses=Array.new
    end
    
    def collect_guess
        return Array.new(4) {Board::Colors[rand(6)]} if @guesses.length==0
        @guesses.sort! do |a,b|
            r= b[1][0] <=> a[1][0]
            if r==0
                r =b[1][1] <=> a[1][1]
            end
            r
        end
        #puts "best guess so far is " + (@guesses[0][0]).to_s + "   " + (@guesses[0][1]).to_s
        newguess=transmute(@guesses[0])
        for i in 1..500 
            if matches_previous(newguess)
                #puts "Got Here!"
                break
            else
                newguess=transmute(@guesses[0])
            end
        end
        if i==500
            puts "oops, bad guess"
        end
#        puts "at line 73 newguess is " + newguess.to_s
        return newguess
    end
    
    def matches_previous(guess)
        @guesses.each do |oldguess|
            new_matches=Board.check_guess(guess,oldguess[0])
            return false if new_matches != oldguess[1]
        end
        return true
    end
    
    def tell_machine(guess,matches)
        @guesses << [guess,matches]
    end
    
    def transmute(guess_match)
 #       puts " at line 78"
        case guess_match[1][0]
            when 0
                guess=permute0(guess_match)
            when 1
                guess=permute1(guess_match)
            when 2
                guess=permute2(guess_match)
        else
            guess=permute3(guess_match)
        end
        return guess
    end
    
    def permute0(guess)
 #       puts "at line 91"
        newguess=guess[0].clone
        case guess[1][1]
            when 0 # just pick new colors
                colors=Board::Colors-guess[0]
                k=colors.length
                newguess=Array.new(4){colors[rand(k)]}
            when 1 # pick one of the same, moved, and 3 different
                fixed=rand(4) # this is the one we keep the same, but we have to move it
                target=rand(3) # we move it one of 3 places
                fixed_color=newguess.delete_at(fixed)
                colors=Board::Colors-newguess
                k=colors.length
                newguess=Array.new(3){colors[rand(k)]}
                if target == fixed
                    newguess << fixed_color
                else
                    newguess.insert(target,fixed_color)
                end
            when 2 # pick two of the same, moved, and 2 different
                newguess.shuffle!
                i=rand(4)
                j=rand(4)
                while i==j
                    j=rand(4)
                end
                colors=Board::Colors-[newguess[i],newguess[j]]
                newguess[i]=colors[rand(colors.length)]
                newguess[j]=colors[rand(colors.length)]
            when 3 # pick three of the same, moved, and 1 different
                newguess=guess[0].shuffle
                k=rand(4)
                colors=Board::Colors-[newguess[k]]
                newcolor=colors[rand(5)]
                newguess[k]=newcolor
        else #pick 4 of the same, but moved
            newguess=guess[0].shuffle
        end
        return newguess
    end
    
    def permute3(guess)
    #    puts "at line 149"
        k=rand(4)
        newguess=guess[0].clone
        replaced_color=newguess[k]
        colors=Board::Colors-[replaced_color]
        newguess[k]=colors[rand(5)]
        return newguess
    end
    
    def permute2(guess)
    #    puts "at line 159"
        newguess=guess[0].clone
        fixed1=rand(4)
        fixed2=rand(4)
        while fixed1==fixed2
            fixed2=rand(4)
        end
        a=[0,1,2,3]-[fixed1,fixed2]
        i=a[rand(2)] # get the other two values
        a=a-[i]
        j=a[0]
        case guess[1][1]
            when 0
                colors=Board::Colors-[newguess[i],newguess[j]]
                newguess[i]=colors[rand(colors.length)]
                newguess[j]=colors[rand(colors.length)]
            when 1
                colors=Board::Colors-[newguess[i]]
                newguess[i]=newguess[j]
                newguess[j]=colors[rand(colors.length)]
        else # the very close case where two colors are right in the right positions and the other two are right in the wrong positions
                temp=newguess[i]
                newguess[i]=newguess[j]
                newguess[j]=temp
        end
        return newguess
    end
    
    def permute1(guess)
        #puts "at line 223"
        k=rand(4)
        newguess=guess[0].clone
        save=newguess.delete_at(k)
        case guess[1][1]
            when 3
                newguess.shuffle!
            when 2
                newguess.shuffle!
                j=rand(3)
                colors=Board::Colors-[newguess[j]]
                newguess[j]=colors[rand(colors.length)]
            when 1
                newguess.shuffle!
                j=rand(3)
                i=rand(3)
                while i==j
                    i=rand(3)
                end
                colors=Board::Colors-[newguess[j],newguess[i]]
                newguess[j]=colors[rand(colors.length)]
                newguess[i]=colors[rand(colors.length)]
        else
            colors=Board::Colors-[newguess[0],newguess[1],newguess[2]]
            for i in 0..2
                newguess[i]=colors[rand(colors.length)]
            end
        end
        newguess.insert(k,save)
        return newguess
    end
end
