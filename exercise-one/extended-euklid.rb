# Ruby script to calculate ggT(a,b) via euklid
@a = ARGV[0].to_i
@b = ARGV[1].to_i

# Function to validate our own implementation
# Found on http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/77359
def calculate_gcd(a, b)
  a, b = b, a % b while b != 0
  a
end

def valid_input(a, b)
  ( a*a + b*b ) != 0
end

def a_b_positive
  @a, @b = @a.abs, @b.abs
end

def a_larger_b
  @a, @b = @b, @a if @b > @a
end

def diophant_solved(x, y)
  calculate_gcd(@a, @b) == ( @a*x + @b*y)
end

def extended_euklid
  puts "a: #{@a} b: #{@b}"
  index = 0
  r = Array.new
  k = Array.new
  r[index], r[index+1] = @a, @b
  k[index], k[index+1] = 1, 0
  q = Array.new
  loop do
    index = index+1
    q[index] = r[index-1] / r[index]
    r[index+1] = r[index-1] - (q[index] * r[index])
    k[index+1] = k[index-1] - (q[index] * k[index])
    puts "Step: r: #{r} q: #{q.compact}"
    break if diophant_solved(k[index], (r[index] - k[index] * @a) / @b)
  end
  puts "x: #{k[index]}"
  puts "y: #{(r[index] - k[index] * @a) / @b}"
end

# Main function
if valid_input(@a, @b)
  a_b_positive
  a_larger_b
  calculate_gcd(@a, @b)
  extended_euklid
end
