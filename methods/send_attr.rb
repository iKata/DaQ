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