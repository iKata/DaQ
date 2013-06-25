def compare
  puts 'usages:ruby compare.rb old.md new.md'; exit unless ARGV.length==2
  ARGV.each do |item|
    puts "#{item} isn't exists";exit unless File.exists? item
  end
  old_content = File.open(ARGV[0]).readlines
  new_content = File.open(ARGV[1]).readlines

  puts 'add content:'
  puts new_content - old_content

  puts '_____________________________________'

  puts 'remove content'
  puts old_content - new_content
end

puts compare