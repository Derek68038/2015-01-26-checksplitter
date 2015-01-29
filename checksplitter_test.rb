require_relative 'checksplitter'
require 'minitest/autorun'

class CheckSplitterTest < Minitest::Test
  
  def test_simple_input_with_expected_integer_output
    cs = CheckSplitter.new(100, 4)
    assert_equal(30, cs.per_person)
  end

  def test_if_tax_is_default_value
    check = CheckSplitter.new(100, 4)
    assert_equal(20, check.tip)
  end
end
  