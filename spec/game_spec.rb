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
    expect(game.code.pattern).to eq(['R', 'G', 'B', 'Y'])
  end

  context 'methods' do
    it 'responds to printing methods' do
      game = Game.new

      expect(game).to respond_to(:welcome)
      expect(game).to respond_to(:instructions)
    end

    xit 'accepts user input' do
      game = Game.new

      expect(game.game_menu('p')).to 
    end

    xit 'calls generate & turn method' do
      game = Game.new

      expect
    end

    xit 'compares guess to code' do
      game = Game.new

      expect(game.compare('rgby')).to eq(true)
      expect(game.compare('bbry')).to eq(false)
    end
  end
end
