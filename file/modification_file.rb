# File.rename('sample.md','old.md')
# content = []
# File.open('old.md','r') do |item|
#   while line = item.gets
#     content << line
#   end
# end
# new_file = File.new 'new.md','w'
# content.each{|item| new_file.puts item}
# new_file.close

require "ftools"
File.copy 'old.md','new.md'
File.open 'new.md','a' do |file|
  file.puts
  file.puts "\trequire 'ftools'"
  file.puts "\tFile.open 'old.md','new.md'"
end