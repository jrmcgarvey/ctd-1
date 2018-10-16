require_relative "board"

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
