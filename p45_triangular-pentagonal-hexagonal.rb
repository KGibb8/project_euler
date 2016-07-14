
# Triangle, pentagonal, and hexagonal numbers are generated by the following formulae:

# Triangle	 	Tn=n(n+1)/2	 	1, 3, 6, 10, 15, ...
# Pentagonal	 	Pn=n(3n−1)/2	 	1, 5, 12, 22, 35, ...
# Hexagonal	 	Hn=n(2n−1)	 	1, 6, 15, 28, 45, ...
# It can be verified that T285 = P165 = H143 = 40755.

# Find the next triangle number that is also pentagonal and hexagonal.

# ATTEMPT No. 3

pentagonals = {}
hexagonals = {}
both = []

n = 1
loop do
  pentagonals[n] = n.nth_pentagonal
  hexagonals[n] = n.nth_hexagonal
  n += 1
  break if n == 100000
end

hexagonals.each do |key, value|
  both << value if value.pentagonal?
end

puts both

# both = [1, 15, 40755, 567645, 1533776805]
# Answer is 1533776805, but the actual answer to the question SHOULD be 567645?


# ATTEMPT No. 2

class Fixnum
  def nth_triangle
    n = (self * (self + 1)) / 2
  end

  def nth_pentagonal
    n = (self * ((3 * self) - 1)) / 2
  end

  def nth_hexagonal
    n = (self * (2 * self - 1))
  end
end

found = false
i = 143
until found
 i += 1
 result = (i * (2 * i - 1))
 if result.pentagonal?
    found = true
    puts result
   end
 end
end

# Also puts answer as 567645

# ATTEMPT No. 1

class Fixnum
  def triangular?
    n = Math.sqrt((8 * self) + 1)
    n % 1 == 0 ? true : false
  end

  def pentagonal?
    n = (Math.sqrt(24 * self + 1)) + 1  / 6
    n % 1 == 0 ? true : false
  end

  def hexagonal?
    n = (Math.sqrt(8 * self + 1)) + 1 / 4
    (n % 1 == 0) ? true : false
  end
end

found = false
n = 40755
until found
  n += 1
  if n.triangular?
    if n.pentagonal?
      if n.hexagonal?
        found = true
        puts n
        break
      end
    end
  end
end

# puts answer = 567645