puts "whats is your name?" 
name=gets.chomp

 
puts "what is your volume level?" 
volume=gets.chomp.to_i
 
 
puts "what is your fur color?" 
color=gets.chomp

 
puts "are you a good hamster? (True/False)" 
good=gets.chomp

if good=="True"
	good=true
else
	good=false
end
 
puts "how old are you?" 
age=gets.chomp

 
if age=="" 
	age=nil 
end
age=age.to_i

puts "your name is #{name}" 
puts "on a loudness scale of 1 to 10, you are #{volume}" 
puts "your color is #{color}" 
if good==true  
	puts "you are a good hamster!" 
else 
	puts "you are not worthy!" 
end 
puts "you are #{age} years old" 
