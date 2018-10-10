class T3array
    attr_reader :gamestate
    
    def initialize
        @gamestate="         "
        @display_array=[]
        for i in 0..22 # set the array to blank
            @display_array[i]=" " * 23
        end
        @display_array[7]= "-" * 23 # draw horizontal lines
        @display_array[15]= "-" * 23
        for i in 0..22
            @display_array[i][7]="|" 
            @display_array[i][15]="|"
        end
        @display_array[6][0]="1"
        @display_array[6][8]="2"
        @display_array[6][16]="3"
        @display_array[14][0]="4"
        @display_array[14][8]="5"
        @display_array[14][16]="6"
        @display_array[22][0]="7"
        @display_array[22][8]="8"
        @display_array[22][16]="9"
    end
    
    def render
        for i in 0..22
            puts @display_array[i]
        end
    end
    
    def move(i,player)
        @gamestate[i]=player
        if player == "x"
            draw_x(i)
        else
            draw_o(i)
        end
    end
    
    def self.moves_left(a)
        a.include?(" ")
    end
    
    def self.find_winner(state)
    #    puts "xx "+ a + "x
        if state[0..2]=="xxx"
            return "x"
        elsif state[0..2]=="ooo"
            return "o"
        elsif state[3..5]=="xxx"
            return "x"
        elsif state[3..5]=="ooo"
            return "o"
        elsif state[6..8]=="xxx"
            return "x"
        elsif state[6..8]=="ooo"
            return "o"
        elsif state[0] + state[3] + state[6]=="xxx"
            return "x"
        elsif state[0] + state[3] + state[6]=="ooo"
            return "o"
        elsif state[1] + state[4] + state[7]=="xxx"
            return "x"
        elsif state[1] + state[4] + state[7]=="ooo"
            return "x"
        elsif state[2] + state[5] + state[8]=="xxx"
            return "x"
        elsif state[2] + state[5] + state[8]=="ooo"
            return "o"
        elsif state[0] + state[4] + state[8]=="xxx"
            return "x"
        elsif state[0] + state[4] + state[8]=="ooo"
            return "o"
        elsif state[2] + state[4] + state[6]=="xxx"
            return "x"
        elsif state[2] + state[4] + state[6]=="ooo"
            return "o"
        else
            return nil
        end
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
    
    def draw_x(i)
        ul=find_upper_left(i)
        @display_array[ul[0]][ul[1]]="X"
    #    puts "Here!"
    #    puts ul.to_s
    #    puts @display_array[ul[0]]
        @display_array[ul[0]+1][ul[1]+1]="X"
        @display_array[ul[0]+2][ul[1]+2]="X"
        @display_array[ul[0]+3][ul[1]+3]="X"
        @display_array[ul[0]+4][ul[1]+4]="X"
        @display_array[ul[0]][ul[1]+4]="X"
        @display_array[ul[0]+1][ul[1]+3]="X"
        @display_array[ul[0]+3][ul[1]+1]="X"
        @display_array[ul[0]+4][ul[1]+0]="X"
    end
                
    def draw_o(i)
        ul=find_upper_left(i)
        @display_array[ul[0]][ul[1]+1]="O"
        @display_array[ul[0]][ul[1]+2]="O"
        @display_array[ul[0]][ul[1]+3]="O"
        @display_array[ul[0]+1][ul[1]]="O"
        @display_array[ul[0]+2][ul[1]]="O"
        @display_array[ul[0]+3][ul[1]]="O"
        @display_array[ul[0]+4][ul[1]+1]="O"
        @display_array[ul[0]+4][ul[1]+2]="O"
        @display_array[ul[0]+4][ul[1]+3]="O"
        @display_array[ul[0]+1][ul[1]+4]="O"
        @display_array[ul[0]+2][ul[1]+4]="O"
        @display_array[ul[0]+3][ul[1]+4]="O"
    end
end
