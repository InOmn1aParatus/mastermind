require './lib/code.rb'

RSpec.describe Code do
    it 'exists' do
        secret_code = Code.new

        expect(secret_code).to be_a(Code)
    end

    it 'holds a code' do
        secret_code = Code.new
        secret_code.generate

        expect(secret_code.pattern.length).to eq(4)
        expect(secret_code.pattern).to include('R', 'G', 'B', 'Y')
    end

    it 'generates random color combo' do
        secret_code = Code.new
        code1 = secret_code.generate
        code2 = secret_code.generate
        code3 = secret_code.generate

        expect(code1).to_not eq(code2 || code3)
    end
end