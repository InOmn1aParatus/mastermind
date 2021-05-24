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
    xit 'responds to printing methods' do
      game = Game.new

      expect(game).to respond_to(:welcome)
      expect(game).to respond_to(:instructions)
      expect(game).to respond_to(:quit)
    end

    xit 'game_menu accepts user input' do
      game = Game.new

      expect(game.game_menu('p')).to receive(:run)
      expect(game.game_menu('i')).to receive(:instructions)
      expect(game.game_menu('q')).to receive(:quit)
    end

    xit '#run calls generate & turn method' do
      game = Game.new

      expect(game).to receive(:run) # and contains @code.generate
      # expect(game.run).to contain(@code.generate)
      # expect(game.run).to call(game.turn)
    end

    xit 'checks input for validity' do
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

    # it '


  end
end
