require_relative 'dinnerclub'
require 'minitest/autorun'

class DinnerClubTest < Minitest::Test

  def test_if_group_list_is_a_hash
    group = DinnerClub.new(["a", "b", "c"])
    assert_nil @group_list
  end

  def test_if_bill_in_event_is_fixnum
    group = DinnerClub.new(["a", "b", "c"])
    group.group_list
    group.event("Lot 2", ["a", "b", "c"], 123)
    assert_kind_of Fixnum, 123
  end
  
  def test_if_location_is_hash
    group = DinnerClub.new(["a", "b", "c"])
    assert_kind_of String, @location 
  end
end
