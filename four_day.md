#第四天

##Sinatra

###牛刀小试
gem install sinatra`安装。

	get '/' do
		"Hello,World"
	end
	
`ruby xxx.rb`,localhost:4567

###用MD作Blog

####做简单的blog

- 引用md的引擎`require "rdiscount"`
- 可以将路由指向md的文件名，该文件名默认在./views目标下。
- 比如当markdown :one_day时，实际指向./views/one_day.md
- 可以使用将one_day.md移到子目录里

####查看指定的blog


	get '/blogs/:name' do
		markdown :"blogs/#{params[:name]}"
	end

- 添加/:name参数
- 使用params[:name]来获取参数

###指定首页
- 建立public目录，静态文件默认在public目录下
- 在public下建立index.html文件
- 在`/`路由下指定`send_file File.join(settings.public_folder,'/index.html')`
- 将所需的css和js文件全部copy至public目录下

###将blog目录显示在首页
- 建立/blogs路由`get_blogs.to_json`
- 从localhost:4567/blogs测试数据
- 在index.html里使用$.get从/blogs获取数据
- 利用$加页面添加到首页上

###美化blog页面
- 使用`erb :blog,:locals=>{:content=>(markdown :"blogs/#{params[:name]}").force_encoding('utf-8')}`取代markdown渲染。设置:locals变量中content的内容采用从md文件里读取的值
- 特别注意从markdown中读取的值为中文，所以需要`force_encoding('utf-8')`转码
- 设置blog.erb中的变量为`<%= locals[:content]%>`