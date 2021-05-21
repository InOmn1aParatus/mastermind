require './lib/code.rb'
require './lib/game.rb'
require 'pry'

RSpec.describe Game do
  it 'exists' do
    game = Game.new

    expect(game).to be_a(Game)
  end

  context 'methods' do
    xit 'displays welcome message' do
      game = Game.new

      expect(game.welcome).to start_with("Welcome")
    end

    xit 'has instructions' do
      game = Game.new

      expect(game.instructions).to start_with("I")
    end
  end
end
