class Player
  attr_accessor :name, :lives

  def initialize(name, lives)
    @name = name
    @lives = lives
  end
  def lose_life
    @lives -= 1
  end

  def lost
    @lives == 0
  end

  def new_question
    new_question = Question.new
    new_question.ask_question(name)
    print 
    @choice = $stdin.gets.chomp
    if new_question.answer(@choice.to_i)
      puts "That is CORRECT!!"
    else 
      puts "Sorry that is INCORRECT!"
      lose_life
    end
  end
end 
