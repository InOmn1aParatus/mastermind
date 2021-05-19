class Code
    attr_reader :pattern

    def initialize
        @pattern = []
    end

    def generate
        code_colors = ['R', 'G', 'B', 'Y']
        @pattern = code_colors.shuffle!
    end
end