# Ruby script to calculate ggT(a,b) via euklid
@basis = ARGV[0].to_i
@exponent = ARGV[1].to_i
@modulos = ARGV[2].to_i

binary = "%b" % @exponent
array_size = binary.length
n = 1
erg_buffer = [1, 1]
faktor_last = @basis
faktor_new = 1

loop do
  if binary[array_size - n] == "1"
    faktor_new = faktor_last if n == 1
    faktor_new = (faktor_last * faktor_last) % @modulos if n > 1
    erg_buffer[1] = (erg_buffer[0] * faktor_new) % @modulos
  else
    faktor_new = faktor_last if n == 1
    faktor_new = (faktor_last * faktor_last) % @modulos if n > 1
    erg_buffer[0] = erg_buffer[1]
  end
  faktor_new, faktor_last = faktor_last, faktor_new
  n = n + 1
  break if n > array_size
end

puts "#{@basis}^#{@exponent} mod #{@modulos} = #{erg_buffer[1]}"
