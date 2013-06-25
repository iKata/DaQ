require "open-uri"

url = "http://www.baidu.com/s?ie=utf-8&bs=%5B%E5%A7%9C%E5%BF%97%E8%BE%89+%E6%95%8F%E6%8D%B7%5D&f=8&rsv_bp=1&rsv_spt=3&wd=%5B%E5%A7%9C%E5%BF%97%E8%BE%89+%E6%95%8F%E6%8D%B7%5D&inputT=0"
html = open(url)
content = html.read


def get_info(content,infos)
	title_regexp = /<h3\s+class="t">.*href="(.*)"\s+target.*?>(.*)<\/a><\/h3>/m
	title_regexp.match(content) do
		title = {:title=>$2,:url=>$1}
		infos << title
	end
end

def scan_info(content)
	infos = []
	content_regexp = /<table\s+cellpadding="0"\s+cellspacing="0"\s+class="result"\s+.*?<\/table>/
	content.scan(content_regexp) do |item|
		get_info item,infos
	end
	infos
end


scan_info(content).each do |item|
	puts item[:title]
	puts item[:url]
	puts "---------------------------------"
end