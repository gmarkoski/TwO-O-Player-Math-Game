require "./players"
require "./question"

class Game 

  def initialize
    @player1 = Player.new('Ali', 3)
    @player2 = Player.new('John', 3)
    @current_player = @player1
  end

  def scores_of_players
    puts "#{@player1.name} : #{@player1.lives}/3 vs #{@player2.name} : #{@player2.lives}/3"
    puts "\n"
    puts "----- NEW TURN -----"
    puts "\n"
  end

  def switch_player
    @current_player = (@current_player == @player1)? @player2 : @player1
  end

  def start
    puts "----- Lets Play!!-----"
    puts "\n"
    self.switch_player
    question = Question.new
    question.ask(@current_player.name)
    answer = gets.chomp.to_i

    if answer == question.sum
      puts "Yes, you are correct!"
      self.scores_of_players
      self.start
    else
      puts "No! Incorrect."
      @current_player.lives -= 1
      self.scores_of_players
      if(@current_player.lives > 0)
        self.start
      else
        puts "Game Over"
        self.switch_player
        puts "#{@current_player.name} wins with a score of #{@current_player.lives}"
      end
    end
  end
end 