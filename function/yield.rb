class Fixnum
  def my_times
    i = self
    while i > 0
      yield
      i -= 1
    end
  end
end

4.my_times{puts "hi,this's my times"}