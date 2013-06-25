require "yaml"

class Configuration
	def initialize
		@attributes = {}	
	end
	def method_missing(method,arg)
	  method = method.to_s
		if method =~ /^find_/
		  method_name = method.delete('find_')
      yield arg if block_given?
      "you load #{method_name},arg=#{arg}"
	  else
      if method =~ /=$/
  		  @attributes[method.delete('=').to_sym] = arg 
  		else
  		  @attributes[method.delete('=').to_sym]
  	  end
    end
	end
	def respond_to?(method)
	  return true if method.to_s=~/^find_/ || super
	  false
	end
end

conf = Configuration.new

YAML.load_file('config.yml').each do |k,v|
	conf.send "#{k}=",v
end

conf.instance_eval do
	puts @attributes
end

puts conf.find_title('aa')

conf.find_title(3) do |c|
  puts 7 * c
end

puts conf.methods.grep /^find/
puts conf.respond_to? :find_title
puts conf.respond_to? :abc