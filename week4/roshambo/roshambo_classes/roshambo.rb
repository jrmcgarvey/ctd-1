class Roshambo < Game
  attr_reader :choices, :round, :wins, :losses, :draws, :player_choice, :ai_choice
  attr_writer :player_choice, :ai_choice, :wins, :losses, :draws # allows me to rewrite variables

  def initialize(game)
    @choices = %w(rock paper scissors)
    @rounds = game.rounds
    @wins = game.wins
    @losses = game.losses
    @draws = game.draws
    @player_choice = ""
    @ai_choice = ""
  end

  def self.play(roshambo)
    roshambo.rounds.times do
      player_choice = player_choice(roshambo)
      roshambo.ai_choice = roshambo.choices[rand(3)]
      round_results(roshambo)
    end
  end

  def self.player_choice(roshambo)
    until roshambo.choices.include?(roshambo.player_choice.downcase)
      puts '<----------------- Rock, Paper, Scissors, Shoot: ----------------->'
      roshambo.player_choice = gets.chomp.downcase
    end
  end

  def self.round_results(roshambo)
    puts "You chose #{roshambo.player_choice}, AI choose #{roshambo.ai_choice}"
    draw(roshambo) if roshambo.player_choice == roshambo.ai_choice
    loss(roshambo) if roshambo.player_choice == roshambo.choices[roshambo.choices.index(roshambo.ai_choice) - 1]
    win(roshambo) if roshambo.player_choice == roshambo.choices[roshambo.choices.index(roshambo.ai_choice) - 2]
  end


  def self.win(roshambo)
    puts "---->You win"
    roshambo.wins += 1
  end

  def self.loss
    puts "---->AI wins"
    roshambo.losses += 1
  end

  def self.draw
    puts "---->draw"
    roshambo.draws += 1
  end

end
