require "rdiscount"
module  MD_Marker
  def to_html
    File.open(get_html_file_name, "w") { |file|  file.write('<meta charset="utf-8"><br/>');file.write(content)}
  end
  def get_html_file_name
    file_name.gsub '.md','.html'
  end
  def content
    RDiscount.new(File.open(file_name).readlines.join).to_html
  end
end

class MdMarker
  include MD_Marker
  def initialize(name)
    @name = name
  end
  def file_name
    @name
  end
end

MdMarker.new('../one_day.md').to_html