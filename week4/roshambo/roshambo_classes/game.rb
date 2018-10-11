class Game
  attr_reader :rounds, :wins, :losses, :draws # allows me to access variables publicly

  def initialize(rounds)
    @rounds = rounds
    @wins = 0
    @losses = 0
    @draws = 0
  end

  def self.start
    puts "Let's play Rock, Paper, Scissors!"
    print "How many rounds would you like to play? "
    rounds = gets.chomp.to_i
  end

  def self.end
    puts "wins = #{wins}\nlosses = #{losses}\ndraw = #{draws}"
      if wins > losses
        puts "Great Job! You're a Winner!"
      elsif wins < losses
        puts 'Game Over. You Lose.'
      else
        puts 'Draw.'
      end
  end
end
