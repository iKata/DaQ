class Module
	def my_methods
		puts 'jobs'
	end

	private
	def private_my_methods
		puts 'my_private_method'
	end
end

class Hello
	private_my_methods
	def use_private_method
		
	end
end

puts Module.instance_methods.grep /^my/
puts Module.private_instance_methods.grep /^private/

String.my_methods
# String.private_my_methods

h = Hello.new
puts Hello.superclass