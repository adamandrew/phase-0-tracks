# Pseudocode:
# Create a hash to store all the data
# Ask the user questions for values, convert data type, then store in keys
# Print out the keys and values in readable way
# Give user one chance to change one values
# Print out the keys and values again

# Hash to store
client = Hash.new

# Ask for information and turn into appropriate data type
puts "What is the client's name?"
client[:name] = gets.chomp

puts "What is the client's age?"
client[:age] = gets.chomp.to_i

puts "Does the client like the color blue?"
like_blue = gets.chomp
if like_blue == "true" || like_blue == "yes"
	client[:like_blue] = true
elsif like_blue == "false" || like_blue == "no"
	client[:like_blue] = false
else
	client[:like_blue] = "not specified"
end

# Print out the hash
p client
print "The client's name is #{client[:name]}. Client is #{client[:age]} year old. "
if client[:like_blue] == "not specified"
	puts "Client doesn't care about blue."
elsif client[:like_blue]
	puts "Client likes blue."
else
	puts "Client doesn't like blue."
end

# Ask if anything need to be changed
puts "Is there anything you want to change?"
change = gets.chomp
if change == "none"

elsif change == "name"
	puts "What is the client's name?"
	client[:name] = gets.chomp
elsif change == "age"
	puts "What is the client's age?"
	client[:age] = gets.chomp.to_i
elsif change == "like_blue"
	puts "Does the client like the color blue?"
	like_blue = gets.chomp
	if like_blue == "true" || like_blue == "yes"
		client[:like_blue] = true
	elsif like_blue == "false" || like_blue == "no"
		client[:like_blue] = false
	else
		client[:like_blue] = "not specified"
	end
else
	puts "I will assume you don't need any changes."
end

p client
print "The client's name is #{client[:name]}. Client is #{client[:age]} year old. "
if client[:like_blue] == "not specified"
	puts "Client doesn't care about blue."
elsif client[:like_blue]
	puts "Client likes blue."
else
	puts "Client doesn't like blue."
end