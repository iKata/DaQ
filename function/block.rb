def call_back(&block)
  arg = 'hello'
  block.call arg
end

call_back do |item|
  puts "#{item},world"
end