require './lib/code'
require './lib/guess'

RSpec.describe Guess do
  it "exists" do
    guess_1 = Guess.new('rgby')

    expect(guess_1).to be_a(Guess)
  end

  it 'tracks turn count' do
    expect(Guess.turn_count).to eq(1)
    guess_2 = Guess.new('rgbb')

    expect(Guess.turn_count).to eq(2)
  end
end
