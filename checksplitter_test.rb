require_relative 'checksplitter'
require 'minitest/autorun'

class CheckSplitterTest < Minitest::Test
  
  def test_simple_input_with_expected_integer_output
    cs = CheckSplitter.new(100, 4)
    assert_equal(35, cs.return)
  end
end