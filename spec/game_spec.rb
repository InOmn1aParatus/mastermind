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

    it 'checks input for validity' do
      game = Game.new
      
      game.valid?('rgbb')
      expect(game.turn_count).to eq(1)
      
      game.valid?('c')
      expect(game.turn_count).to eq(2)
      
      # test for user_guess too short
      # test for user_guess too long
    end

    xit 'evaluates guess against code' do
      game = Game.new

    end

    it 'convert time into minutes and seconds' do
      game = Game.new

      expect(game.game_timer.game_min).to eq(0)
    end

  end
end
