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

conf.instance_eval do
	puts @attributes
end