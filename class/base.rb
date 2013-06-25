class MyClass
  def initialize(name)
    @name = name
  end
  def name
    @name
  end
  def name=(name)
    @name = name
  end
end

my_class = MyClass.new 'jobs'
puts my_class.name
my_class.name = 'iverson'
puts my_class.name