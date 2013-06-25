# encoding:utf-8
require "open-uri"
html = open("http://www.baidu.com/s?ie=utf-8&bs=%E5%A7%9C%E5%BF%97%E8%BE%89+%E8%AE%BE%E8%AE%A1%E5%8C%A0%E8%89%BA&f=8&rsv_bp=1&rsv_spt=3&wd=%E5%A7%9C%E5%BF%97%E8%BE%89+%E6%95%8F%E6%8D%B7&rsv_sug3=4&rsv_sug1=3&rsv_sug4=178&inputT=1383")
content = html.read

@infos = []

def get_info(content)
  reg_info = /<h3\s+class="t"><a\s+.*href="(.*)"\s+target=.*>(.*)<\/a><\/h3>/m
  content.scan(reg_info) do |item|
    info = {:title=>$2,:url=>$1}
    @infos << info
  end
end

reg_all = /<table\s+cellpadding="0"\s+cellspacing="0"\s+class="result".*?<\/table>/m

count = 0
faces=[]
content.scan(reg_all) do |table|
  get_info(table)
end

@infos.each  do |item|
  count += 1
  puts count
  puts "____________________________________"
  puts "Title:#{item[:title]}"
  puts "Url:#{item[:url]}"
  puts "____________________________________"
  puts "____________________________________"
end
