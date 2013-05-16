# Object Oriented Ruby
# http://www.tutorialspoint.com/ruby/ruby_object_oriented.htm



# ruby F:\github\helloruby\week2\OOP.rb


class Box
	@@count = 0
	Version ="10.0.0.7"
	def initialize(w,h)
		@width = w
		@height = h
		@@count +=1
	end
	def getwidth
		@width
	end
	def getheight
		@height
	end
	def setwidth=(value)
		@width=value
	end
	def setheight=(value)
		@height=value
	end
	def getarea
		@width * @height
	end
	def self.printCount()
		puts "box count is :#{@@count}"
	end
	def to_s
		"(w:#{@width},h:#{@height})"
	end
	#Operator Overloading
	def +(other)  #Operator Overloading
		Box.new(@width+other.width , @height+other.height) 
	end
	def -@  #Operator Overloading
		Box.new(-@width , -@height)
	end
	def *(scalar)   #Operator Overloading
		Box.new(@width*scalar , @height*scalar)
	end

	# puts "type of self = #{self.type}"           error
	# puts "name of self = #{self.name}"           error
end

box = Box.new(10,20)
box1 = Box.new(20,30)
box2 = Box.new(30,40)

box.setwidth=30
box.setheight=50

x=box.getwidth()
y=box.getheight()

a=box.getarea()

puts "width of box is : #{x}"
puts "height of box is : #{y}"
puts "area of box is : #{a}"
Box.printCount()
puts "string representation of box is : #{box}"  #string representation of box is : (w:10,h:20)

# Class Inheritance:
class Bigbox < Box
	def printarea
		@area = @width*@height
		puts "big box area is :#{@area}"
	end
	def getarea
		@area = @width*@height
	end
end
box = Bigbox.new(5,4)
box.printarea()
box.getarea()    #error

#Freezing Objects
box.freeze
if (box.frozen?)
	puts "box object is frozen object"
else
	puts "box object is normal object"
end

# box.setwidth =15
# box.setheight =25
# x=box.getarea()
# y=box.getheight()

# puts "#{x}"
# puts "#{y}"

#Class Constants
puts Box::Version

# Create object using allocate:
box3 = Box.allocate
a = box1.getarea()
b = box3.getarea()