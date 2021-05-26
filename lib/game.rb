require './lib/code'

class Game
  attr_reader :code,
              :turn_count,
              :starting,
              :ending

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
    puts 'Thanks for playing! Come back when you are ready for a challenge.'
    exit
  end

  def game_menu(user_input)
    if user_input == 'p' || user_input == 'play'
      run
    elsif user_input == 'i' || user_input == 'instructions'
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
    puts "I have generated a beginner sequence with four elements"
    puts "made up of: (r)ed, (g)reen, (b)lue, and (y)ellow."
    puts "Use (q)uit at any time to end the game."
    @starting = Time.now
    turn
  end

  def valid?(user_guess)
    user_guess.downcase!
    if user_guess.count("rbgy") == 4
      @turn_count += 1
      evaluate(user_guess)
    elsif user_guess == 'c'
      @turn_count += 1
      puts "The secret code is: '#{@code.pattern.join}'"
      turn
    elsif user_guess == 'q'
      quit
    elsif user_guess.length < 4
      puts 'Your guess is too short'
      print '>  '
      valid?(gets.chomp)
    elsif user_guess.length > 4
      puts 'Your guess is too long'
      print '>  '
      valid?(gets.chomp)
    else
      puts "Sorry, but your guess can only include 'R', 'B', 'G', or 'Y'."
      print '>  '
      valid?(gets.chomp)
    end
  end

  def position(user_guess)
    position = user_guess.zip(@code.pattern).map { |g_ltr, c_ltr| g_ltr if g_ltr == c_ltr }
    position.compact.length
  end

  def element(user_guess)
    element = user_guess.intersection(@code.pattern)
    element.length
  end

  def evaluate(user_guess)
    return end_game if @code.pattern == user_guess.split('')
    user_guess = user_guess.split('')
    puts "'#{user_guess.join}' has #{element(user_guess)} of the correct elements"
    puts "with #{position(user_guess)} in the correct positions."
    if @turn_count > 1
      puts "You've taken #{@turn_count} guesses."
    else
      puts "You've taken #{@turn_count} guess."
    end
  end

  def turn
    while @turn_count < 10 do
      puts 'What is your guess?'
      print '>  '
      user_guess = (gets.chomp)
      valid?(user_guess)
    end
    puts 'Game Over!'
    puts 'Would you like to (p)lay again or (q)uit?'
    print '>  '
    game_menu(gets.chomp)
    @turn_count = 0
  end

  def game_timer
    @ending = Time.now
    game_time = @ending - @starting
    game_min = (game_time / 60.0).floor
    game_sec = (game_time % 60.0).round
    puts "Congratulations! You guessed the sequence '#{@code.pattern.join.upcase}' in #{@turn_count} guesses over #{game_min} minutes, #{game_sec} seconds."
  end

  def end_game
    game_timer
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
