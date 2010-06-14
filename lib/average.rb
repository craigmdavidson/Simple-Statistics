require 'rounding'
require 'percent'

class Array
  
  def mean
    self.inject(0) { |sum, x| sum += x } / self.size.to_f      
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
  
end