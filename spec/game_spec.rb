require './lib/code.rb'
require './lib/game.rb'
require 'pry'

RSpec.describe Game do
  xit 'exists' do
    game = Game.new

    expect(game).to be_a(Game)
  end

  xit 'had Code attribute' do
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

    it 'calls game menu' do
      game = Game.new
      allow(game).to receive(:gets).and_return('p')
      allow(game).to receive(:game_menu).and_return('Game Menu called')
      expect(game.welcome).to eq('Game Menu called')

      allow(game).to receive(:gets).and_return('i')
      allow(game).to receive(:game_menu).and_return('Game Menu called')
      expect(game.instructions).to eq('Game Menu called')
    end

    it 'game_menu accepts user input' do
      game = Game.new
      allow(game).to receive(:run).and_return('Run called')
      expect(game.game_menu('p')).to eq('Run called')

      allow(game).to receive(:instructions).and_return('Instructions called')
      expect(game.game_menu('i')).to eq('Instructions called')

      allow(game).to receive(:quit).and_return('Quit called')
      expect(game.game_menu('q')).to eq('Quit called')
    end

    it 'creates initial game conditions' do
      game = Game.new
      allow(game.code).to receive(:generate).and_return(['r', 'g', 'b', 'y'])
      allow(Time).to receive(:now).and_return(2)
      allow(game).to receive(:turn).and_return('Turn called')

      expect(game.run).to eq('Turn called')
      expect(game.code.pattern).to eq(['r', 'g', 'b', 'y'])
      expect(game.starting).to eq(2)
    end

    it 'recognizes valid guesses' do
      game = Game.new
      user_guess = 'RBGY'
      allow(game).to receive(:evaluate).and_return('Evaluate called')

      expect(game.valid?(user_guess)).to eq('Evaluate called')
      expect(game.turn_count).to eq(1)
      expect(user_guess).to eq('rbgy')
    end

    it 'returns secret code' do
      game = Game.new
      user_guess = 'c'
      allow(game).to receive(:turn).and_return('Turn called')

      expect(game.valid?(user_guess)).to eq('Turn called')
      expect(game.turn_count).to eq(1)
    end

    it 'allows midgame quit' do
      game = Game.new
      user_guess = 'q'

      allow(game).to receive(:quit).and_return('Quit called')
      expect(game.valid?('q')).to eq('Quit called')
    end

    xit 'detects incorrect guess length' do
      game = Game.new
      user_guess = 'rbg'
      allow(game).to receive(:valid?).and_return('valid? called')

      # user_guess = 'rggby'

      expect(game.valid?).to eq(0)
    end

  end
end
