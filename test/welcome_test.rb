require "test_helper"

class WelcomeTest < Minitest::Test
  def test_welcome_msg
    out, err = capture_io do
      load '../lib/tic_tac_toe/welcome.rb'
    end

    assert_equal "Welcome to Tic Tac Toe", out
  end
end
