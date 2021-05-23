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

  def quit
    puts 'Thanks for playing. Come back when you are ready for a challenge.'
    exit
  end

  def game_menu(user_input)
    if user_input == 'p' || user_input == 'play'
      run
    elsif user_input == 'i'
      instructions
    elsif user_input == 'q' || user_input == 'quit'
      quit
    else
      puts "Hmmmm . . ."
      sleep 3
      welcome
    end
  end

  def run
    @code.generate
    turn
  end

  def valid?(user_guess)
    user_guess.downcase!
    if user_guess.count("rbgy") == 4
      evaluate(user_guess)
    elsif user_guess == 'c'
      p @code.pattern.join
    elsif user_guess == 'q'
      quit
    elsif user_guess.count < 4
      puts 'Your guess is too short'
      print '>  '
      valid?(gets.chomp)
    else
      puts 'Your guess is too long'
      print '>  '
      valid?(gets.chomp)
    end
  end

  def evaluate(user_guess)
    return end_game if @code.pattern == user_guess.split('')
    user_guess = user_guess.split('')
    position = user_guess.zip(@code.pattern).map { |g_ltr, c_ltr| g_ltr if g_ltr == c_ltr }
    element = user_guess.zip(@code.pattern).map { |g_ltr, c_ltr| g_ltr if g_ltr == c_ltr }
    puts "'#{user_guess.join}' has #{element.compact.length} of the correct elements"
    puts "with #{position.compact.length} in the correct positions."
    if @turn_count > 1
      puts "You've taken #{@turn_count} guesses."
    else
      puts "You've taken #{@turn_count} guess."
    end
  end

  def turn
    while @turn_count < 11 do
      puts 'What is your guess?'
      print '>  '
      user_guess = (gets.chomp.upcase)
      valid?(user_guess)
    end

  end

  def end_game
    puts "Congratulations! You guessed the sequence '#{@code.pattern}' in #{@turn_count} guesses over #{}."
    puts "Do you want to (p)lay again or (q)uit?"
    print '>  '
    game_menu(gets.chomp)
  end
end

# game = Game.new
# user_guess = (gets.chomp)
# # require'pry';binding.pry
# game.valid?(user_guess)
# # puts result
# # p "end"
