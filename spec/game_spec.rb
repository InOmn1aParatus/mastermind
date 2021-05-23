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
    expect(game.code.pattern).to eq(['r', 'g', 'b', 'y'])
  end

  context 'methods' do
    it 'responds to printing methods' do
      game = Game.new

      expect(game).to respond_to(:welcome)
      expect(game).to respond_to(:instructions)
      expect(game).to respond_to(:quit)
    end

    it 'game_menu accepts user input' do
      game = Game.new

      expect(game.game_menu('p')).to receive(:run)
      expect(game.game_menu('i')).to receive(:instructions)
      expect(game.game_menu('q')).to receive(:quit)


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

    xit 'checks input for validity' do
      game = Game.new

      expect(game.valid?('RgBy')).to eq(true)
      # expect(game.valid?('c')).to eq('rgby')
      # expect(game.valid?('q')).to eq('rgby')
    end
  end
end
