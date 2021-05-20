require './lib/code.rb'

RSpec.describe Code do
    it 'exists' do
        secret_code = Code.new

        expect(secret_code).to be_a(Code)
    end

    it 'holds a code' do
        secret_code = Code.new

        expect(secret_code.pattern).to eq([])

        secret_code.generate
        expect(secret_code.pattern.length).to eq(4)
        expect(secret_code.pattern).to include('R', 'G', 'B', 'Y')
    end
end
