require './lib/code'

class Game
  attr_reader :code

  def initialize
    @code = Code.new
  end

  def welcome
    puts 'Welcome to MASTERMIND'
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    begin_game(gets.chomp)
  end

  def instructions
    puts 'I will come up with a secret 4-color code.' 
    puts 'Your job is to guess the correct colors in the correct order within 10 turns.'
    puts 'After each guess I will give you two hints to tell how close you were.'
    puts 'Guess the code... and you win!'
    puts 'Use up your turns... GAME OVER :('
    puts '(p)lay? (q)uit?'
    begin_game(gets.chomp)
  end

  def begin_game(user_input)
    if user_input == 'p'
      # "banana"
    elsif user_input == 'i'
      instructions
    elsif user_input == 'q'
      # exits
    else
      "Hmmmm..."
      welcome
    end
  end


  
end