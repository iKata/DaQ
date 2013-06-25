module Printable
	def print
		'Printable'
	end
end
module Document
	def print_screen
		print
	end
	def print
		'Document'
	end
end
class Sequence
	include Document
	include Printable
end

s = Sequence.new
puts s.print_screen