require File.dirname(__FILE__) + '/../lib/percent.rb'
require 'test/unit'

class PercentTest < Test::Unit::TestCase
  
  def test_percent
    assert_equal "99.11%", 1.9911.as_percent(2)
    assert_equal "99%", 1.9911.as_percent
  end

  def test_handle_non_numbers
    assert_equal "NaN", "NaN".as_percent(2)
  end
  
end