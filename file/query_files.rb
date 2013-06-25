def query_files(condition)
  entries = Dir.entries('.')
  entries.select{|item| item if condition=~item}
end

puts query_files(/\.md$/)