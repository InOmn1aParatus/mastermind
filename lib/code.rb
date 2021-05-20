class Code
    attr_reader :pattern

    def initialize
        @pattern = ['R', 'G', 'B', 'Y']
    end

    def generate
        # @pattern = 4.times{['R', 'G', 'B', 'Y'].sample}
        @pattern = 4.times.map { pattern.sample }
    end
end
