# ruby F:\github\helloruby\codecademy\object-oriented\oo.rb


class Language
	def initialize(name,creator)
		@name = name
		@creator = creator		
	end
	def des
		puts " i'm #{@name} and i was created by ", @creator ,"\n"
	end
end

ruby = Language.new("ruby","Yukihiro Matsumoto")
python = Language.new("python","Guido van Rossum")
javascript = Language.new("javascript","Brendan Eich")


ruby.des
python.des
javascript.des

class Computer
  $manufacturer = "Mango Computer, Inc."
  @@files = {hello: "Hello, world!"}
  
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def current_user
    @username
  end
  
  def self.display_files
    @@files
  end
end

# Make a new Computer instance:
hal = Computer.new("Dave", 12345)

puts "Current user: #{hal.current_user}"
# @username belongs to the hal instance.

puts "Manufacturer: #{$manufacturer}"
# $manufacturer is global! We can get it directly.

puts "Files: #{Computer.display_files}"
# @@files belongs to the Computer class.

class Box
  def initialize(w,h)  # constructor method
    @width = w
    @height = h
  end
  def getwidth   #accessor methods
    @width
  end
  def getheight
    @height
  end
  def setwidth=(value)   #setter methods
    @width = value
  end
  def setheight=(value)
    @height = value
  end
end

puts box = Box.new(10,20)  #create an object

box.setwidth = 30   #use setter methods
box.setheight = 50

x = box.getwidth()  #use accessor method
y = box.getheight()

puts "width of the box is: #{x}"
puts "height of the box is: #{y}" 

class ApplicationError
  def display_error
    puts "Error! Error!"
  end
end

class SuperBadError < ApplicationError
end

err = SuperBadError.new
err.display_error

class Machine
  @@users = {}
  
  def initialize(username, password)
    @username = username
    @password = password
    @@users[username] = password
    @files = {}
  end
  
  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "#{filename} was created by #{@username} at #{time}."
  end
  
  def Machine.get_users
    @@users
  end
end

my_machine = Machine.new("eric", 01234)
your_machine = Machine.new("you", 56789)

my_machine.create("groceries.txt")
your_machine.create("todo.txt")

puts "Users: #{Machine.get_users}"


