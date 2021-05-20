class Code
    attr_reader :pattern

    def initialize
        @pattern = []
    end

    def generate
        @pattern = ['R', 'G', 'B', 'Y'].shuffle!
    end
end
