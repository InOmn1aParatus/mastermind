require './lib/code'

class Game
  attr_reader :code

  def initialize
    @code = Code.new
    @turn_count = 0
  end

  def welcome
    puts 'Welcome to MASTERMIND'
    puts 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    print '>  '
    game_menu(gets.chomp)
  end

  def instructions
    puts 'I will come up with a secret 4-color code.'
    puts 'Your job is to guess the correct colors in the correct order within 10 turns.'
    puts 'After each guess I will give you two hints to tell how close you were.'
    puts 'Guess the code... and you win!'
    puts 'Use up your turns... GAME OVER :('
    puts '(p)lay? (q)uit?'
    print '>  '
    game_menu(gets.chomp)
  end

  def game_menu(user_input)
    if user_input == 'p'
      puts 'We playin now'
    elsif user_input == 'i'
      instructions
    elsif user_input == 'q'
      puts 'We done'
    else
      puts "Hmmmm...\n\n"
      welcome
    end
  end

  def run
    @code.generate
    turn
  end

  def valid?(user_guess)
    if user_guess.length < 4
      if user_guess == 'c'
        puts @code
      elsif user_guess == 'q'
        puts "good bye"
      else
        puts "too short"
      end
    elsif user_guess.length == 4
      if user_guess contains 'r' || user_guess contains 'g' || user_guess contains 'b' || user_guess contains 'y' 

        true
      else
        "Your can only contain r,g,b or y. please try agian"
      end
    else
      puts "too long"
    # user_guess.split("")
    end
    # elsif user_guess.is_a?(Integer)
  end

  def turn
    while turn_count < 11 do
      puts 'What is your guess?'
      print '>  '
      user_guess = (gets.chomp.upcase)
      valid?(user_guess)
    end
  end

  def compare(guess)
    if guess.size != 4
    end
  end
end

game = Game.new
user_guess = (gets.chomp)
# require'pry';binding.pry
result = game.valid?(user_guess)
# puts result
p "end"
