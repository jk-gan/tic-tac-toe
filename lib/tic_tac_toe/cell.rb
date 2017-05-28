module TicTacToe
  class Cell
    attr_accessor :value
    def initialize(value = '')
      @value = value
    end

    def available?
      value == '-'
    end
  end
end
