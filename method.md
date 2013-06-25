#方法

##动态方法

###send :method_name,args

send方法要求第一个参数发送给对象的消息，也就是方法的名字。所有剩下的参数会直接传递给调用的方法。什么时候使用它呢？有时候我们不知道用户会使用什么方法，只有到最后一刻才决定调用这个方法，此时动态派发技术会非常有用。举个例子，YAML的配置文件就可以通过send轻松设值。如：

	require "yaml"

	class Configuration
		attr_accessor :title,:description
	end

	conf = Configuration.new

	YAML.load_file('config.yml').each do |k,v|
		conf.send "#{k}=",v
	end
	
###define_method name do |arg|
接着上例，我们可不可以不定义Configuration的属性，而是在需要的时候再进行定义呢？这种情况在O/R M里经常遇到，以往的方式是为O定义和R相关联的属性，但是这些属性是可以不用定义的，在需要的时候从R中获取，动态定义。我们用上例来模仿一下O/R M：

	require "yaml"
	class Configuration
		def initialize
			@attributes = {}	
		end
		def self.add_attr(name)
			define_method "#{name}=" do |arg|
				@attributes[name] = arg
			end
			define_method "#{name}" do
				@attributes[name]
			end
		end
	end
	conf = Configuration.new
	YAML.load_file('config.yml').each do |k,v|
		Configuration.add_attr(k)
		conf.send "#{k}=",v
	end
	
###其实send也可以做到

	require "yaml"

	class Configuration
	end

	conf = Configuration.new

	YAML.load_file('config.yml').each do |k,v|
		Configuration.send "attr_accessor",k.to_sym
		conf.send "#{k}=",v
	end

	conf.instance_eval do
		puts @title
		puts @description
	end
	
###method_missing(method,*args)
当在Ruby中调用一个对象的方法时，它首先会沿着先右一步，然后向上的方式查找所需要的方法。如果找不到，它就会调用method_missing的方法。因此我们可以通过覆写method_missing()方法来完成找不到调用的方法时的处理。还是上例，我们可以这么完成：

	require "yaml"

	class Configuration
		def initialize
			@attributes = {}	
		end
		def method_missing(method,arg)
			@attributes[method.to_sym] = arg unless @attributes[method]
			@attributes[method.to_sym]
		end
	end

	conf = Configuration.new

	YAML.load_file('config.yml').each do |k,v|
		conf.send "#{k}=",v
	end

	conf.instance_eval do
		puts @attributes
	end

###再进一步
我们在使用Rails时，ActiveRecord的类库一定给我们带来了不小的感官。那实在是太酷了！比如Product.find_by_title(),哇哦，DHH是如何知道Product里有一个叫title的字段呢？通过幽灵方法，我们可以实现一个简单的版本：
