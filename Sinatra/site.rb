require "sinatra"
require "rdiscount"
require 'json'

get '/' do
	# File.read(File.join(settings.public_folder,'/index.html'))
	send_file File.join(settings.public_folder,'index.html')
end

def get_blogs
	dir_path = File.join(settings.views,'blogs')
	mds = []
	Dir.entries(dir_path).each do |blog|
		mds << blog.delete('.md') if blog=~/.md$/
	end
	mds
end

get '/blogs' do
	get_blogs.to_json
end

get '/blogs/:name' do
	erb :blog,:locals=>{:content=>(markdown :"blogs/#{params[:name]}").force_encoding('utf-8')}
end