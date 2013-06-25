module MyModule
	MyConstants = 'outer constant'
	module Unit
		class TestCase
			
		end
	end
	class MyClass
		MyConstants = 'inner constant'
	end
end


puts MyModule::MyClass::MyConstants
puts MyModule::Unit::TestCase.class
puts MyModule.constants
