# class

# ruby F:\github\helloruby\rubyprogramming\Chapter8\class.rb


# instance_of?与 is_a? 检查实例是否属于某个类  
str = "this is a apple"
p str.is_a?(String)  #is_a? 检查是否父子关系
p str.is_a?(Object)
p str.instance_of?(Hash)

class HelloWorld  #类名要大写
	def initialize(myname="ruby")
		@name = myname        #@name为实例变量
	end
	def hello
		print "Hello,world.I am ",@name,".\n"
	end
end

bob = HelloWorld.new("Bob")
bullock = HelloWorld.new("Bullock")
ruby = HelloWorld.new

ruby.hello
bullock.hello()

# 访问方法       error
# class Helloname
# 	def name
# 		return @name
# 	end
# 	def name=(value)
# 		@name = value
# 	end
# end

# Helloname.new("bullock")



# attr_reader :name      定义用来读取的方法（定义name方法）
# attr_writer :name      定义用来写入的方法
# attr_accessor :name    定义读取与写入的方法


# 类方法
class Helloworld
	def Helloworld.hello(name)
		print name ," said Hello.\n"
	end
end
Helloworld.hello("bullock")


class << Helloworld
	def hello(name)
		print name ," said Hello."
	end
end
Helloworld.hello("kelvin")
puts

class Helloworld
	def self.hello(name)
		print name ," said Hello.\n"
	end
end
Helloworld.hello("chou")

# 常数
class Helloworld
	Version = 1.9    #必须大写
end
p Helloworld::Version

# 类变量
class HelloCount
	@@count = 0
	def HelloCount.count
		@@count
	end
	def initialize(myname = "ruby")
		@name = myname
	end
	def hello
		@@count +=1
		print "Hello,world.i am ", @name , ".\n"
	end
end

p HelloCount.count
bullock = HelloCount.new("bullock")
bullock.hello
p HelloCount.count
 
# 扩充类

# 使用继承
class RingArray < Array
	def [] (i)   
		idx = i%size  #求得实际的索引值
		super(idx)   #调用父类中同名的方法
	end
end
eto = RingArray["a","b","c","d","e","f","g"]
p eto[0]
p eto[2]
p eto[-1]

# 限制方法
class AccTest
	def pub
		puts "pub is a public method."
	end
	public :pub
	def priv
		puts "priv is a private method."
	end
	private :priv
end

acc = AccTest.new
acc.pub


class AccTest
	public        #没有指定实参，下面定义的所有方法都是public
	def pub
		puts "pub is a public method."
	end
	private       #没有指定实参，下面定义的所有方法都是private
	def priv
		puts "priv is a private method."
	end
end

class Point
	attr_accessor :x , :y
	protected :x= , :y=
	def initialize(x=0.0,y=0.0)
		@x = x
		@y = y
	end
	def swap(other)
		xtmp = @x
		ytmp = @y
		@x = other.x
		@y = other.y
		other.x = xtmp
		other.y = ytmp
		self
	end
end

p0 = Point.new
p1 = Point.new(1.0,2.0)
p [p0.x , p0.y]
p [p1.x , p1.y]

p0.swap(p1)
p [p0.x , p0.y]
p [p1.x , p1.y]
