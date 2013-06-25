require "yaml"

class Configuration
	attr_accessor :title,:description
end

conf = Configuration.new

YAML.load_file('config.yml').each do |k,v|
	conf.send "#{k}=",v
end

conf.instance_eval do
	puts @title
	puts @description
end