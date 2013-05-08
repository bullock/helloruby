# ruby F:\github\helloruby\week1\RubyExercises\RubyExercises.rb

# ruby helloruby/week1/calculator.rb

# 1. Use the "each" method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

array = [1,2,3,4,5,6,7,8,9,10]
array.each{|n| print n }
puts
puts array[4]

# 2. Same as above, but only print out values greater than 5.
array.each{|n| print n if n > 5}
puts

# 3. Now, using the same array from #2, use the "select" method to extract all odd numbers into a new array.
p array.values_at(0,2,4,6,8)

# 4. Append "11" to the end of the array. Prepend "0" to the beginning.
array.push(11)

# 5. Get rid of "11". And append a "3".
array.push(11)
array.delete(3)
p array

# 6. Get rid of duplicates without specifically removing any one value. 
array.uniq
p array

# 7. What's the major difference between an Array and a Hash?


h = {a:1, b:2, c:3, d:4}

# 9. Get the value of key "b".
p h[:b]

# 10. Add to this hash the key:value pair {e:5}
h["e"] = 5    #疑问
p h

# 13. Remove all key:value pairs whose value is less than 3.5
h.delete_if{|key,value|  value <3.5}
print h