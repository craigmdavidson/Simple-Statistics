require File.dirname(__FILE__) + '/../lib/rate_of_change.rb'
require File.dirname(__FILE__) + '/../lib/average.rb'
require 'test/unit'

class RateOfChangeTest < Test::Unit::TestCase
  
  def test_multiplier
    assert_equal 2.0, [].multiplier(2.0, 1.0)
    assert_equal 1.0, [].multiplier(1.0, 1.0)
    assert_equal 0.5, [].multiplier(1.0, 2.0)
  end
  
  def test_simple
    a = [10,20,30,40,50].growth
    assert_equal 1.0, a[0]
    assert_equal 2.0, a[1]
    assert_equal 1.5, a[2]
    assert_in_delta 1.333, a[3], 0.001
    assert_in_delta 1.25, a[4], 0.001    
  end
  
  def test_constant_change_rate
   assert_equal [1.0,1.0,1.0,1.0,1.0], [10,10,10,10,10].rate_of_change
  end
  
  def test_zero
   assert_equal [1.0,1.0,1.0,1.0,1.0], [0,0,0,0,0].rate_of_change
  end
  
  def test_change_rate
    roc = [121.2,104.7,99.1,95.5,95.5].reverse.rate_of_change
    assert_equal roc[0], 1.0
    assert_equal roc[1], 1.0
    assert_in_delta 1.037, roc[2], 0.01
    assert_in_delta roc[3], 1.056, 0.01    
    assert_in_delta roc[4], 1.158, 0.01
  end
  
  def test_median_rate_of_change
    assert_equal 1.038, [121.2,104.7,99.1,95.5,95.5].reverse.rate_of_change.median.round_to(3), 0.01
  end
  
  def test_median_rate_of_change_as_percent
    assert_equal "3.77%", [121.2,104.7,99.1,95.5,95.5].reverse.rate_of_change.median.as_percent(2)
  end  
  
  def test_weighted_moving_averge_rate_of_change_as_percent
    assert_equal "8.75%", [121.2,104.7,99.1,95.5,95.5].reverse.rate_of_change.wma.as_percent(2)    
  end
  
  def test_weighted_moving_average_growth_as_percent
    assert_equal "8.75%", [121.2,104.7,99.1,95.5,95.5].reverse.growth.wma.as_percent(2)        
  end
end