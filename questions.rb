class Question

  def initialize
   @num1 = rand(1..20)
   @num2 = rand(1..20)
  end

  def ask(name)
    puts "#{name}: What does #{@num1} + #{@num2} equal?"
  end

  def sum
    @num1 + @num2
  end

end 