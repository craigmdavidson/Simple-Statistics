require 'rounding'

class Object

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