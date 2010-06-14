require File.dirname(__FILE__) + '/../lib/rounding.rb'
require 'test/unit'


class RoundingTest < Test::Unit::TestCase
  def test_round_float
    assert_equal 42, 42.2127.round_to(0)
    assert_equal 42.2, 42.2127.round_to(1)
    assert_equal 42.21, 42.2127.round_to(2)
    assert_equal 42.213, 42.2127.round_to(3)
    assert_equal 42.2127, 42.2127.round_to(4)
  end
  
  def test_round_fixnum
    assert_equal 42, 42.round_to(2)
  end
  
  def test_round_string
    assert_equal "-", "-".round_to(2)
    assert_equal "4.2123", "4.2123".round_to(1)
    assert_equal 4.2, "4.2123".to_f.round_to(1)    
  end

end