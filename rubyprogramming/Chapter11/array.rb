# encoding: UTF-8
# Array

# ruby  F:\github\helloruby\rubyprogramming\Chapter11\array.rb

# 建立数组
num = [1,2,3,4,5]
strs = ["a","b","c","d"]

# Array.new
a = Array.new  #建立0个元素的数组
p a

a = Array.new(5)  #建立长度为5的值全部为nil的数组
p a


b = Array.new(5 , 0)  #建立长度为5，数组值为0的数组
p b

# %w 建立数组  元素是字符串且不含空白
lang = %w(ruby perl python java php .net)
p lang     #["ruby","perl","python","java","php",".net"]

# to_a 将hash转化为array
color_table = {"black"=>"#000000","white"=>"#ffffff"}
p color_table.to_a

#error
# split 将逗号or空白隔开的字符串 转化为 数组
column = "1985/1/1 09:00 test.html proxy01.example.ne.jp".split
p column

# 索引
num = [1,2,3,4,5,6,7,8,9,10]
num[0]
num[3] = "a"
print num
puts
print num[3..9]  #["a",5,6,7,8,9,10]
puts
print num[0,3]   #[1,2,3]
puts
# a.at(n)         等同于   a[n]
# a.slice(n)      等同于   a[n]
# a.slice(n..m)   等同于   a[n..m]
# a.slice(n,len)  等同于   a[n,len]

# 改写元素
alpha = ["a","b","c","d","e"]
alpha[2,3] = ["C","D","E"]
print alpha

# 插入元素
puts
size = ["small","normal","big","bigger"]
size[0,0] = ["smaller"]
print size
puts
size[5,0] =["biggest","biggest+1"]
print size
puts

# 多个索引建立数组  a.values_at(n1.n2,......)
alpha = %w(a b c d e f g h i j k)
print alpha.values_at(1,3,5,7,9,11,13,15)  #["b","d","f","h","j", nil , nil , nil]
puts

# 集合的数组
arry1 = ["a","b","c"]
arry2 = ["b","c","d"]
p arry1 + arry2    #交集
p (arry1|arry2)    #并集
p arry1-arry2	   #差集

# 作为列表的数组

# 加入元素  Unshift 前端   push 末端
# 取出元素  shift   前端   pop  末端
# 读取原色  first   前端   last 末端

# queue 取出元素，以元素加入的顺序取出，  先进先出   （使用push，shift方法）
# stack 取出元素，以元素加入相反顺序取出，后进先出   （使用push，pop方法）

al = ["a","b","c","d","e","f"]
print al.push("g")
puts
print al.shift
puts
print al

puts al.pop

