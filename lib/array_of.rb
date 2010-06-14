module Enumerable
  def array_of method_name
    self.collect {|element| element.method(method_name).call}
  end
end