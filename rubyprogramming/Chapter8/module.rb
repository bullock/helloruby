# module

# ruby F:\github\helloruby\rubyprogramming\Chapter8\module.rb

# http://www.kuqin.com/rubycndocument/man/syntax_defcm.html


# module与class的不同：
# 1.module不能建立实例 
# 2.module不能继承

# Max-in 将模块混进类里
module MyModule
  #想要共同提供的方法
end

class MyClass1
	include MyModule
	#MyClass1 所特有的方法
end

class MyClass2
	include MyModule
	#MyClass2 所特有的方法
end

module HelloModule
	Version = "1.0"
	def hello(name)
		print "hello," , name , ".\n"
	end
	module_function :hello   #将hello以模块函数形式公开
end
p HelloModule::Version
HelloModule::hello("bullock")

include HelloModule   #读入
p Version
hello("bullock")