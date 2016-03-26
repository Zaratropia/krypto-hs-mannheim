# Ruby script to calculate ggT(a,b) via euklid
@a = ARGV[0].to_i
@b = ARGV[1].to_i

# Function to validate our own implementation
# Found on http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/77359
def calculate_gcd(a, b)
  a, b = b, a % b while b != 0
  puts "Check with internal function: ggT(#{ARGV[0]}, #{ARGV[1]}): #{a}"
end

def valid_input(a, b)
  ( a*a + b*b ) != 0
end

def a_larger_b
  @a, @b = @b, @a if @b > @a
end

# Main function
if valid_input(@a, @b)
  a_larger_b
  calculate_gcd(@a, @b)
  r = -1 # initial value to define error in calculation
  loop do
    r = @a % @b
    y = @a / @b
    puts "a: #{@a} b: #{@b} r: #{r} y: #{y}"
    break if r == 0 # check if calculation is finished
    @a = @b
    @b = r
  end
  puts "ggT(#{ARGV[0]}, #{ARGV[1]}): #{@b}" unless r == -1
end
