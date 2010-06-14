class Object
  def round_to(x)
    return (self * 10**x.to_f).round / 10**x.to_f
  rescue  
    self
  end  

end