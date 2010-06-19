
module Enumerable
  def array_of method_name
    self.collect {|element| element.method(method_name).call}
  end
end

class Array
  def mean
    self.inject(0) { |sum, x| sum += x } / (self.size.to_f)
  end
  def median already_sorted=false
    return nil if self.empty?
    array = self.sort unless already_sorted
    m_pos = array.size / 2
    return array.size % 2 == 1 ? array[m_pos] : array[m_pos-1..m_pos].mean
  end
  def wma
    values = self.reverse
    periodLength = values.length - 1
    sum = 0; 
    weightedSum = 0; 
    for n in 0..periodLength
        weightedSum = weightedSum + ((periodLength - n) * values[n]);
        sum = sum + n; 
    end
    return weightedSum / sum;    
  end 
  def growth
    rate_of_change
  end
  def rate_of_change
    previous = nil   
    result = Array.new
    self.each{|this| result << multiplier(this,previous) and previous = this}
    result    
  rescue
    self
  end
  def multiplier(this, previous)
    return 1.0 if previous == nil || previous.to_f == 0.0
    1 + ((this.to_f - previous.to_f)/previous.to_f.abs)
  end
end

class Object
  def round_to(x)
    return (self * 10**x.to_f).round / 10**x.to_f
  rescue  
    self
  end  
  def as_percent(rounding = 0)
    return "#{as_percent_number(rounding)}%" 
  rescue
    self
  end
  def as_percent_number(rounding = 0)
    percent = ((self-1.0) * 100).round_to(rounding)
    rounding == 0 ? percent.to_i : percent
  end
end