require 'prime'

x = 0
10.times do |x|
	x ** x
	x+=1
	puts Math.log(x)
	puts x.prime_division
	
	Prime::Generator23.new
end

def highest_biPrimefac(p1, p2, n)
  result = []
  d = p1* p2 * 2
  (n).downto(d).detect do |n|
    if n.prime_division.length ==2
      if  n.prime_division[0][0] == p1 && n.prime_division[1][0] == p2 
       result << n
       result << n.prime_division[0][1]
       result << n.prime_division[1][1]
      end
    end
   end
 return result
end
