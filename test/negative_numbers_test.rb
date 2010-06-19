require File.dirname(__FILE__) + '/../lib/simple_statistics.rb'
require 'test/unit'

class NegativeNumbersTest < Test::Unit::TestCase
  
  def test_positive_start_positive_end
    assert_equal 1.5, [20,30].multiplier(30,20)
    assert_equal "50%", [20,30].growth.wma.as_percent
  end

  def test_positive_start_positive_end_2
    assert_equal "-33%", [30,20].growth.wma.as_percent
  end
 
  def test_negative_start_postive_end
    assert_equal "250%", [-20,30].growth.wma.as_percent
  end

  def test_negative_start_postive_end_2
    assert_equal "167%", [-30,20].growth.wma.as_percent
  end
  
  def test_postive_start_negative_end
    assert_equal "-250%", [20,-30].growth.wma.as_percent
  end
  
  def test_postive_start_negative_end_2
    assert_equal "-167%", [30,-20].growth.wma.as_percent
  end
  
  def test_negative_start_negative_end
    assert_equal "-50%", [-20,-30].growth.wma.as_percent
  end
  
  def test_negative_start_negative_end_2
    assert_equal "33%", [-30,-20].growth.wma.as_percent
  end
  
  def test_zero_start_positive_end
    assert_equal "67%", [0,10,20].growth.wma.as_percent
  end
  
  def test_positive_start_zero_end
    assert_equal "67%", [0,10,20].growth.wma.as_percent
  end

end