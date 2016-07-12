require 'prime'

x = 0
10.times do |x|
	x ** x
	x+=1
	puts Math.log(x)
	puts x.prime_division
	
	Prime::Generator23.new
end