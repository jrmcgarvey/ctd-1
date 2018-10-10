require_relative "t3array.rb"

def collect_move(a,player)
    while true
        a.render
        puts "you are player " + player
        puts "What's your move (1-9)?"
        m=gets.chomp.to_i
        if m<1 or m>9
            puts "That's not a valid move."
        elsif a.gamestate[m-1]!=" "
            puts "That space is taken."
        else
            return m-1
        end    
    end
end

def find_threat(a,player)
    b=a.clone
    for i in 0..8 
        if b[i]==" "
            b[i]=player
            if T3array.find_winner(b)
                return i
            end
            b[i]=" "
        end
    end
    return nil
end
   

def choose_move(a,player)
    i=find_threat(a,player)
    if i!=nil
        return i # winning move
    end
    if player=="x"
        playerb="o"
    else
        playerb="x"
    end
    i=find_threat(a,playerb)
    if i!=nil
        return i # blocking move
    end
    if a=="         " 
        x=rand(3)
        if x==2
            return 0
        else
            return 4
        end
    end

    best_play=-1
    move=nil
    for j in 0..8
        if a[j]==" "
            if move==nil
                move=j
            end
            this_play=is_best_move(a,player,j)
            if this_play>best_play
                move=j
            end
        end
    end
    return move      
end ##first approximation

def is_best_move(a,player,move)
    if player=="x"
        playerb="o"
    else
        playerb="x"
    end
    x=find_threat(a,player)
    if x==move
        return 1 # best move is to win now if we can
    end
#    x=find_threat(a,playerb)
#    if x==move
 #      return 1
#    end # second best is to block the opponent
    b=a.clone
    b[move]=player # else we have to try it out and see what the other guy can do
    if !T3array.moves_left(b)
        return 0 # third best is to take the last available move
    end
    enemy_best=-1
    for i in 0..8
        if b[i]==" "
           r=is_best_move(b,playerb,i)
           if r>enemy_best
              enemy_best=r
           end
        end
    end
#    puts b.to_s
#    puts enemy_best
    case enemy_best
        when -1
            return 1
        when 0
            return 0
        else
            return -1
    end   
    puts "Got Here!!"
    return -1 #should not get here
end    

# main flow
t3array=T3array.new

while true
  puts "Do you want to go first (1) or second (2)?"
  s=gets.chomp
  if s.to_i==1
       first=true
       break
  elsif s.to_i==2
       first=false
       break
  end
end
first_time=true
while true
   if first
      player="x"
      machine="o"
   else
       player="o"
       machine="x"
   end
   if (first || !first_time)
      m=collect_move(t3array,player)
      t3array.move(m,player)
      if T3array.find_winner(t3array.gamestate)!=nil
          t3array.render
          puts("You win!")
          break
      end
      if !T3array.moves_left(t3array.gamestate)
          t3array.render
          puts "cat's game."
          break
      end
   end
   first_time=false
   m2=choose_move(t3array.gamestate,machine)
#   puts "we chose #{m2}"
   t3array.move(m2,machine)
   if T3array.find_winner(t3array.gamestate)!=nil
       puts "!!#{t3array.gamestate}!!"
          t3array.render
          puts("I win!")
          break
   end
   if !T3array.moves_left(t3array.gamestate)
      t3array.render
      puts "cat's game."
      break
   end
end
