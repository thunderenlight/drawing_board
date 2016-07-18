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

#def highest_biPrimefac(p1, p2, n)
#     # your code biggest num, smaller nums exp, larger num exp
#     #until max >= n, (p1 ** (range)) * (p2 **(range))
#     # p1 ** 1..? * p2 ** 1..? 
#     # if p2 **exp > max
#     #   p1 ** exp
#     exp1 = 1
#     exp2 = 1
#     max = p1 * p2
#      until  p1 * p2 >= n
#     	# exp1 += 1

#     	# if p1 * p2  < n &&  p1 * p2  > p1  * p2  ** (exp1 -1)
#     	if p1 * p2 ** (exp2 +1) > max &&  p1 * p2 ** (exp2 +1) <= n
#     		exp2 +=1
#     		p p2 = p2 ** exp2

#     		puts max 
#     		puts "hiya"
    	
#     	elsif p2 * p1 ** (exp1 +1) > max && p2 * p1 ** (exp1 +1) <= n

#     		p "P1"
#     		exp1 += 1
#     		p p1 = p1 ** exp1
#     		max = p1 **( exp1 + 1 )* p2 ** exp2
#     		# break
#     	elsif p1 ** (exp1 +1) * p2 ** (exp2 -1)  > p1 ** (exp1 -1) * p2 ** (exp2 +1)  && p2 * p1 ** (exp1 +1) <= n  && p2 * p1 ** (exp1 +1) > max
#     		p "P2"
#     		p  max = p1 **( exp1 + 1 )* p2 ** exp2
#     		exp2 -= 1
#     	end
#     end
#     puts max

# end
