require "test_helper"

class GameTest < Minitest::Test
  def setup
    @board = TicTacToe::Board.new
    @players = []
    @players << TicTacToe::Player.new('JK', 'X', role[:human])
    @players << TicTacToe::Player.new('Bot', 'O', role[:bot])
  end

  def test_welcome_msg

  end
end
