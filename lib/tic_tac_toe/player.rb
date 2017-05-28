module TicTacToe
  class Player
    attr_reader :name, :score
    attr_accessor :code

    def initialize(name, human)
      @name = name
      @score = 0
      @human = human
      puts "Player #{name} is added"
    end

    def select_cell
      gets.strip.to_i
    end

    def is_human?
      @human
    end
  end
end
