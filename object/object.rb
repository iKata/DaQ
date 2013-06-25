class MyClass
	def my_method
		@v = 1
	end
end

obj = MyClass.new
puts obj.instance_variables
obj.my_method
puts obj.instance_variables
obj.instance_eval{puts @v = 3}

puts obj.methods == MyClass.instance_methods