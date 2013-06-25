def seach(key_word)
  File.open('new.md').each do |item|
    # puts match if match = Regexp.new(key_word).match(item)
    # puts item if item.downcase.include?(key_word)
    item.scan(Regexp.new(key_word)).each do |item|
       puts item
     end
  end
end

seach('File')