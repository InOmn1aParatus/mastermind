require './lib/code.rb'
require './lib/game.rb'
require 'pry'

RSpec.describe Game do
  it 'exists' do
    game = Game.new

    expect(game).to be_a(Game)
  end

  it 'had Code attribute' do
    game = Game.new

    expect(game.code).to be_a(Code)
  end

  context 'methods' do
    it 'responds to printing methods' do
      game = Game.new

      expect(game).to respond_to(:welcome)
      expect(game).to respond_to(:instructions)
    end

    xit 'accepts user input' do
      game = Game.new

      expect(game.begin_game('p')).to 
    end

    

  end
end
