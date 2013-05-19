#calculator

# ruby F:\github\helloruby\week1\calculator.rb

# ruby helloruby/week1/calculator.rb


# print "how old are you?" 
# age=gets.chomp() 
# print "how tall are you" 
# height=gets.chomp() 
# print "how much do you weight?" 
# weight=gets 
# puts "so ,you're #{age} old,#{height} tall and#{weight} heavy." 

puts 
puts "Enter your first number:"
num1 = gets.chomp
puts

puts "Enter your second number:"
num2 = gets.chomp

puts "What would you like to do? 1)add 2)subtract 3)multiply 4)divide"
command = gets.chomp
puts

case command.to_i
	when 1 then puts "#{num1} + #{num2} = #{num1.to_i + num2.to_i}"
	when 2 then puts "#{num1} - #{num2} = #{num1.to_i - num2.to_i}"
	when 3 then puts "#{num1} * #{num2} = #{num1.to_i * num2.to_i}"
	when 4 then puts "#{num1} / #{num2} = #{num1.to_i / num2.to_i}"
	else puts "plase enter a valid command"
	
end

puts
print "input your name :"
name = 1
puts "Hello,#{name}!"
