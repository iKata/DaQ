class MyClass
  def some_behavior_on(a_string)
    a_string.upcase
  end
  def some_behavior
    another_behavior
  end
  def some_behavior_self
    self.another_behavior
  end
  def another_behavior
    "another_behavior used"
  end
end

puts MyClass.new.some_behavior_on('foo')
puts MyClass.new.some_behavior
puts MyClass.new.some_behavior_self

class Adder
  attr_reader :value
  def initialize
    @value = 0
    self
  end
  def add(num)
    @value += num
    self
  end
end

puts Adder.new.add(1).add(4).value

class M
  def start
    1
  end
  def multiplier
    # start = self.start
    start = start()
    start * 30
  end
end

puts M.new.multiplier