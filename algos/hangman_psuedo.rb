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
# highest_biPrimefac(2,3, 50) 

# n.downto(p1) do  |num|
# 	# if num.modulos(p1)[0] > num.modulos(p2)


# increment either primes exponent only if product closer to n , even if removing the other primes exponent gets closer to n without exceeding
#  primes.inject(exp) do |product, (prime, index)|
#  	until product >= n
#  		prime **= exp
#  		exp+=1
#  		if prime  ** (exp-1) * prime > product 

#  		end

 			
#  		end

def prime?(val)
	val = -val if val < 0
	return false if val <2
	for num in 0..val
		q,r = val.divmod(num)
		return true if q < num 
		return false if r == 0
	end
end

def make_valley(arr)
  first = []
  sec = []
  arr.each.with_index {| n, i |  i % 2 == 0 ?  first.push(n) : sec.push(n) }
  ( first + sec.reverse ).flatten
end


Test.describe("make_valley") do
  Test.it("Basic tests 1") do
    testing(make_valley([17, 17, 15, 14, 8, 7, 7, 5, 4, 4, 1]), [17, 15, 8, 7, 4, 1, 4, 5, 7, 14, 17])
    testing(make_valley([20, 7, 6, 2]), [20, 6, 2, 7])
    testing(make_valley([14, 10, 8]), [14, 8, 10])
    testing(make_valley([20, 18, 17, 13, 12, 12, 10, 9, 4, 2, 2, 1, 1]), [20, 17, 12, 10, 4, 2, 1, 1, 2, 9, 12, 13, 18])
    testing(make_valley([20, 16, 14, 10, 1]), [20, 14, 1, 10, 16])
    testing(make_valley([19, 19, 18, 14, 12, 11, 9, 7, 4]), [19, 18, 12, 9, 4, 7, 11, 14, 19])
    testing(make_valley([20, 18, 16, 15, 14, 14, 13, 13, 10, 9, 4, 4, 4, 1]), [20, 16, 14, 13, 10, 4, 4, 1, 4, 9, 13, 14, 15, 18])
    testing(make_valley([20, 20, 16, 14, 12, 12, 11, 10, 3, 2]), [20, 16, 12, 11, 3, 2, 10, 12, 14, 20])
    testing(make_valley([19, 17, 16, 15, 13, 8, 5, 5, 4, 4, 4]), [19, 16, 13, 5, 4, 4, 4, 5, 8, 15, 17])
    testing(make_valley([19, 8, 6]), [19, 6, 8])
  end
end



def play_pass(str, n)
    result_str = " "
    alpha = ("a".."z").to_a
    num = 9
    str.downcase.each_with_index do |l, i|
    	if alpha.include?(l)
    		letter = alpha.index(l) + n
    		result_str << alpha[letter]

    	elsif l.to_i
    		result_str << (l - num).abs.to_s

    	else
    		result_str << l 
    	end
    result_str.reverse  
    		
end
def play_pass(str, n)
    result_str = []
    alpha = ("a".."z").to_a
    num = 9
    str.downcase.each_char.with_index do |l, i|
    	if alpha.include?(l)
    		letter = alpha.index(l) + n
        i.even? ? l.upcase : l
    		result_str << alpha[letter]
       
    	elsif l.to_i == Numeric && l.to_i != 0
    		result_str << (l.to_i - 9).abs.to_s

    	else
    		result_str << l 
    	end
     end
    result_str.map.with_index do |ch, i|
      if i.even? || i == 4
        ch.upcase!
      end
    end
      result_str.join('').reverse  
    		
end
Test.assert_equals(play_pass("I LOVE YOU!!!", 1), "!!!vPz fWpM J")

Test.assert_equals(play_pass("MY GRANMA CAME FROM NY ON THE 23RD OF APRIL 2015", 2), 
    "4897 NkTrC Hq fT67 GjV Pq aP OqTh gOcE CoPcTi aO")
