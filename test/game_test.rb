require "test_helper"

class GameTest < Minitest::Test
  def setup
    @board = Board.new
    @players = []
    @players << Player.new('JK', 'X', role[:human])
    @players << Player.new('Bot', 'O', role[:bot])
  end

  def test_welcome_msg

  end
end
