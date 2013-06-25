class MyClass
  # attr_accessor 'name'
  attr_reader :name,:hello
   attr_writer :name
  def initialize(name)
    @name = name
  end
end

person = MyClass.new 'jobs'
puts person.name
person.name = 'iverson'
puts person.name
puts person.hello