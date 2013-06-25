File.open('sample.md','w') do |log|
  log.puts("#title")
  log.puts('> description')
  log.puts '##create file'
  log.puts '- file.open'
  log.puts '- w'
end