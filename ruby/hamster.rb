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