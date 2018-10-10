
def find_winner(a)
#    puts "xx "+ a + "xx"
    if a[0..2]=="xxx"
        return "x"
    elsif a[0..2]=="ooo"
        return "o"
    elsif a[3..5]=="xxx"
        return "x"
    elsif a[3..5]=="ooo"
        return "o"
    elsif a[6..8]=="xxx"
        return "x"
    elsif a[6..8]=="ooo"
        return "o"
    elsif a[0] + a[3] + a[6]=="xxx"
        return "x"
    elsif a[0] + a[3] + a[6]=="ooo"
        return "o"
    elsif a[1] + a[4] + a[7]=="xxx"
        return "x"
    elsif a[1] + a[4] + a[7]=="ooo"
        return "x"
    elsif a[2] + a[5] + a[8]=="xxx"
        return "x"
    elsif a[2] + a[5] + a[8]=="ooo"
        return "o"
    elsif a[0] + a[4] + a[8]=="xxx"
        return "x"
    elsif a[0] + a[4] + a[8]=="ooo"
        return "o"
    elsif a[2] + a[4] + a[6]=="xxx"
        return "x"
    elsif a[2] + a[4] + a[6]=="ooo"
        return "o"
    else
        return nil
    end
end

def moves_left(a)
    return a.include?(" ")
end
def find_threat(a,player)
    b=a.split('')
    b.each_with_index do | val, index |
        if b[index]==" "
 #           puts "index is #{index}"
            b[index]=player
   #         puts b.join("")
            if find_winner(b.join(""))!=nil
  #              puts "found a winner threat"
                return index
            else
                b[index]=" "
            end    
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
    if !moves_left(b)
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
        
def find_upper_left(i)
    case i
        when 0
            return [0,0]
        when 1
            return [0,8]
        when 2
            return [0,16]
        when 3
            return [8,0]
        when 4
            return [8,8]
        when 5
            return [8,16]
        when 6
            return [16,0]
        when 7
            return [16,8]
        else
            return [16,16]
    end
end

def draw_x(i,a)
    ul=find_upper_left(i)
    a[ul[0]][ul[1]]="X"
    puts "Here!"
    puts ul.to_s
    puts a[ul[0]]
    a[ul[0]+1][ul[1]+1]="X"
    a[ul[0]+2][ul[1]+2]="X"
    a[ul[0]+3][ul[1]+3]="X"
    a[ul[0]+4][ul[1]+4]="X"
    a[ul[0]][ul[1]+4]="X"
    a[ul[0]+1][ul[1]+3]="X"
    a[ul[0]+3][ul[1]+1]="X"
    a[ul[0]+4][ul[1]+0]="X"
    return a
end
            
def draw_o(i,a)
    ul=find_upper_left(i)
    a[ul[0]][ul[1]+1]="O"
    a[ul[0]][ul[1]+2]="O"
    a[ul[0]][ul[1]+3]="O"
    a[ul[0]+1][ul[1]]="O"
    a[ul[0]+2][ul[1]]="O"
    a[ul[0]+3][ul[1]]="O"
    a[ul[0]+4][ul[1]+1]="O"
    a[ul[0]+4][ul[1]+2]="O"
    a[ul[0]+4][ul[1]+3]="O"
    a[ul[0]+1][ul[1]+4]="O"
    a[ul[0]+2][ul[1]+4]="O"
    a[ul[0]+3][ul[1]+4]="O"
    return a
end

def render(a)
        b=a.split("")
        b.each_with_index { |v,i| b[i]=(i+1).to_s if v==" "}
        puts b[0..2].to_s
        puts b[3..5].to_s
        puts b[6..8].to_s
        puts "" 
        display_array=[]
        for i in 0..22 # set the array to blank
            display_array[i]=" " * 23
        end
        display_array[7]= "-" * 23 # draw horizontal lines
        display_array[15]= "-" * 23
        for i in 0..22
            display_array[i][7]="|" 
            display_array[i][15]="|"
        end
        display_array[6][0]="1"
        display_array[6][8]="2"
        display_array[6][16]="3"
        display_array[14][0]="4"
        display_array[14][8]="5"
        display_array[14][16]="6"
        display_array[22][0]="7"
        display_array[22][8]="8"
        display_array[22][16]="9"
        for i in 0..8
            if a[i] == "x"
                display_array=draw_x(i,display_array)
            elsif a[i] == "o"
                display_array=draw_o(i,display_array)
            end
        end
        for i in 0..22
            puts display_array[i]
        end
end

def collect_move(a,player)
    while true
        render(a)
        puts "you are player " + player
        puts "What's your move (1-9)?"
        m=gets.chomp.to_i
        if m<1 or m>9
            puts "That's not a valid move."
        elsif a[m-1]!=" "
            puts "That space is taken."
        else
            return m-1
        end    
    end
end

# main flow
a="         "
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
      m=collect_move(a,player)
      a[m]=player
      if find_winner(a)!=nil
          render(a)
          puts("You win!")
          break
      end
      if !moves_left(a)
          puts "cat's game."
          break
      end
   end
   first_time=false
   m2=choose_move(a,machine)
#   puts "we chose #{m2}"
   a[m2]=machine
   if find_winner(a)!=nil
          render(a)
          puts("I win!")
          break
   end
   if !moves_left(a)
      puts "cat's game."
      break
   end
end
=begin
    move_count=0
    a.each do |v| 
        if v != " " 
            move_count+=1
        end
    end
    if move_count==1 && 
=end      
=begin
    else if player == "x"
       case a 
       when "xo       "
         return 4
       when "x o      "
         return 4
       when "x"
=end

#puts "hi there"