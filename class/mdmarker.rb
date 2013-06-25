# require 'rdiscount'
class MDMarker
  def initialize(file_name)
    @file_name = file_name
  end
  def to_html
    content = []
    File.open(@file_name, "r")  do |file|
      while line = file.gets
        content << "<h1>#{line.delete '# '}</h1>" if /^#/ =~ line
        content << "<blockquote><p>#{line.delete '> '}</p></blockquote>" if /^>\s/ =~ line
        content << "<h2>#{line.delete '## '}</h2>" if /^##\s/ =~ line
        content << "<li>#{line.delete '- '}</li>" if /^-\s/=~line
      end
    end
    # content =  RDiscount.new(File.open(@file_name).readlines.join).to_html
    html_file_name = @file_name.gsub '.md','.html'
    File.open(html_file_name, "w") { |file|  file.puts content.join}
  end
end