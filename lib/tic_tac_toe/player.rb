module TicTacToe
  class Player
    attr_reader :name, :code
    attr_accessor :score

    def initialize(name, code, human)
      @name = name
      @score = 0
      @code = code
      @human = human
      puts "Player #{name} (#{score}) is added using #{code}"
    end

    def select(index, board)
      if board[index]

      end
    end

    def is_human?
      @human
    end
  end
end
