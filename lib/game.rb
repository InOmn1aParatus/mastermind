class Game

  def welcome
    """
    Welcome to MASTERMIND
    Would you like to (p)lay, read the (i)nstructions, or (q)uit?
    """
  end

  def instructions
    """
    I will come up with a secret 4-color code. Your job is to guess the
    correct colors in the correct order within 10 turns. After each guess
    I will give you two hints to tell how close you were.
    Guess the code... and you win!
    Use up your turns... GAME OVER :(
    """
  end

end

game = Game.new
puts game.welcome
puts " "
puts game.instructions
