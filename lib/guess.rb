class Guess
  @@turn_count = 0

  def initialize(input)
    @input = input
    @@turn_count += 1
  end

  def self.turn_count
    @@turn_count
  end
end
