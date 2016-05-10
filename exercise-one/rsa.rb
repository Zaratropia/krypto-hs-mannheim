#require './extended_euklid.rb'
require 'prime'

# Ruby script for rsa exersise
# Parameters
@p = ARGV[0].to_i
@q = ARGV[1].to_i
@e = ARGV[2].to_i

# Helpers
# Found on http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/77359
def calculate_gcd(a, b)
  a, b = b, a % b while b != 0
  a
end

def extended_euklid_for_rsa(a, b)
  index = 0
  r = Array.new
  k = Array.new
  r[index], r[index+1] = a, b
  k[index], k[index+1] = 1, 0
  q = Array.new
  loop do
    index = index+1
    q[index] = r[index-1] / r[index]
    r[index+1] = r[index-1] - (q[index] * r[index])
    k[index+1] = k[index-1] - (q[index] * k[index])
    break if diophant_solved(k[index], (r[index] - k[index] * a) / b)
  end
  (r[index] - k[index] * a) / b
end

def diophant_solved(x, y)
  calculate_gcd(@e, @phi) == ( @e*x + @phi*y )
end

def e_larger_phi
  @e, @phi = @phi, @e if @phi > @e
end

# end Helpers

def valid_rsa_input(p, q, e)
  Prime.prime?(p) && Prime.prime?(q) && e_valid?(e)
end

def e_valid?(e)
  valid = false
  if 1 < e && e < phi(@p, @q)
    valid = calculate_gcd(e, phi(@p, @q)) == 1
  end
  valid
end

def phi(p, q)
  (p - 1)*(q - 1)
end

# Main function
if valid_rsa_input(@p, @q, @e)
  # check prime numbers and e
  puts 'Valid input for p, q and e'
  @phi = phi(@p, @q)
  puts "Phi: #{@phi}"

  # calculate secret d
  e_larger_phi
  @d = extended_euklid_for_rsa(@e, @phi)
  puts "Found secret d: #{@d}"

  # encrypt
  klartext = 2
  puts "Klartext: #{klartext}"
  encrypted = ((klartext**47) % (@p*@q))
  puts "Verschluesselt: #{encrypted}"
  puts encrypted

  # decrypt
  decrypted = ((encrypted**@d) % (@p*@q))
  puts "Entschluesselt: #{decrypted}"
  puts decrypted

  puts "Ver- und Entschluesseln war erfolgreich!" if decrypted == klartext
else
  puts 'Invalid input for p, q and e'
end
