# strings

#   ruby F:\github\helloruby\strings.rb

# ruby helloruby/strings.rb

puts 12 + 12  #24
puts '12' + '12'  #1212
puts ' 12 + 12'   #12+12


puts 'bling '*4  
# bling bling bling bling
puts 'bling *4 '

puts 2 * 5
puts '2' * 5
puts '2 * 5'

puts 'you\'re swell!'
puts 'backslash at the end of a string: \\'
puts 'up\\down'
puts 'up\down'

puts 'I like ' + 'apple pie.'
puts 'I like' + ' apple pie.'

# 格式化输出
printf("%d %.2f %s\n", 1, 99.3, "Justin")
#sprintf 格式化字符串
x = sprintf "%d %.2f %s", 1, 99.3, "Justin"
puts x
