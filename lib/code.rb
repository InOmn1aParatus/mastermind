class Code
    attr_reader :pattern

    def initialize
        @pattern = ['r', 'g', 'b', 'y']
    end

    def generate
        @pattern = 4.times.map { pattern.sample }
    end
end
