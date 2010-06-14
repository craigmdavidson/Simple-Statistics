require File.dirname(__FILE__) + '/../lib/simple_statistics.rb'
require 'test/unit'

class Hash
  def earnings_per_share
    self[:earnings_per_share]
  end
  def year
    self[:year]
  end
  def method_missing m
    self[m]
  end
end

class ArrayOfTest < Test::Unit::TestCase
  
  def setup
    # create an array of hashes
    @a = [{:ticker => "GSK", :earnings_per_share => 30, :year => 2010}, 
          {:ticker => "GSK", :earnings_per_share => 25, :year => 2009},
          {:ticker => "GSK", :earnings_per_share => 10, :year => 2008}]
    assert_equal 30, @a[0].earnings_per_share
    assert_equal 25, @a[1].earnings_per_share    
    assert_equal 10, @a[2].earnings_per_share    
  end
  
  def test_extract
    assert_equal [30, 25, 10], @a.array_of(:earnings_per_share)
    assert_equal [2010, 2009, 2008], @a.array_of(:year)    
  end
  
end