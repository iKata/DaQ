#第一天

先从Markdown格式的博客说起。`jekyll --server`.

##安装环境
###一键安装
- ruby,可选
- rails
- sublime

###关于墙
- gem sources --remove https://rubygems.org/
- gem sources -a http://ruby.taobao.org/
- gem sources -l

###安装帮助
	gem install rdoc-data
	rdoc-data --install
	
##文件操作
###写一个MD格式的文件
- File.open('',r)
- new_file = File.new '','w'
- content << line
- file.gets

###比较两个文件
- arr1 - arr2
- ARGV
- if or unless
- File.exists?
###查看某个文件中是否包含指定的文本
- include?
- =~
- Regexp.new('string').match
###找到所有符合条件的文件
- Dir.entries('.')
- /^\.md$/
- Array.collect Array.select Array.reject

##Class
###Base
- class
- initialize
- reader
- accessor

###attr
- attr_accessor
- attr_reader
- attr_writer
- string & symbol
- :.methods - ''.methods
- not initialize & initialize not block

###Self
- 和指定的对象交互
- 默认使用自己的
- 显示指定self
- Adder.new.add(1).add(3).add(2).value
- start=start & start=self.start

##MDMarkder
###to_html
- `#{}`
- `^ \s`
- gsub '',''
- [].join

###rdiscount
- `gem install rdiscount`
- `RDiscount.new(File.open(@file_name).readlines.join).to_html`