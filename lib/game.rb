class Game

  def welcome
    p 'Welcome to MASTERMIND'
    p 'Would you like to (p)lay, read the (i)nstructions, or (q)uit?'
    begin_game(user_input)
  end

  def instructions
    p 'I will come up with a secret 4-color code.' 
    p 'Your job is to guess the correct colors in the correct order within 10 turns.'
    p 'After each guess I will give you two hints to tell how close you were.'
    p 'Guess the code... and you win!'
    p 'Use up your turns... GAME OVER :('
    begin_game(user_input)
  end

  # def begin_game(user_input)
  #   if user_input == 'p'
  #     # run method
  #   elsif user_input == 'i'
  #     instructions
  #   elsif user_input == 'q'
  #     # exits
  #   else
  #     "Hmmmm..."
  #     welcome
  #   end
  # end
end