require "test/unit"

$before_at = /^[0-9a-zA-Z]+[_0-9a-zA-Z]+/
$after_at = /^[0-9a-zA-Z]+[-?0-9a-zA-Z]*\.[a-zA-Z]+$/
$mail_regexp = /#{$before_at}\@#{$after_at.to_s.sub('^','')}/
def valide_before(mail_string)
	return false unless $before_at =~ mail_string
	true
end
def valide_after(mail_string)
	return true if $after_at =~ mail_string
	false
end
def valide_mail(mail_string)
	return true if $mail_regexp =~ mail_string
	false
end

valide_mail('jobs2010@gmail.com')



class Mail_Test < Test::Unit::TestCase
	def test_valide_before
		assert valide_before('jobs2010')
		assert valide_before('333jfds2')
		assert valide_before('34afdsa_fdsa'),'_#'
		assert_equal 3,3
	end
	def test_valide_after
		assert valide_after('163.com')
		assert valide_after('gmail.com')
		assert valide_after('yahoo-bb.cn')
		assert valide_after('37signal.com')
	end
	def test_valide_mail
		assert valide_mail('jobs2010@gmail.com')
		assert valide_mail('3d34_fsw@163.com')
		assert valide_mail('f34dsey_d3@yahoo-bb.cn')
	end
end