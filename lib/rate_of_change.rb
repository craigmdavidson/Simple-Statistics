class Array
  
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
    previous != nil && previous != 0 ? (this.to_f/previous.to_f) : 1.0
  end
  
end