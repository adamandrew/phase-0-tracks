# Pseudocode:
# - Write a method that changes a consonant to next consonent
# 	- get consonant's index in string "bcdfghjklmnpqstrwxyz"
# 	- change consonant to "bcdfghjklmnpqstrwxyz"[index + 1]
# 		- if consonant is z, change to b
# - Write a method that changes a vowel to next vowel
# 	- get vowel's index in string "aeiou"
# 	- change vowel to "aeiou"[index + 1]
# 		- if vowel is u, change to a
# - Write a method that turn real name into fake name
# 	- Split full name into array of first and second name
# 	- Reverse the array
# 	- Split first and last name into array of letters
# 	- Apply previous two methods to each letter
# 	- Rejoin all the letters into new fake name

def next_consonant(letter)
	vowels = "bcdfghjklmnpqrstvwxyz"
	if letter == "z"
		return "b"
	else
		index = vowels.index(letter)
		return vowels[index + 1]
	end
end
# p next_consonant("z")

def next_vowel(letter)
	vowels = "aeiou"
	if letter == "u"
		return "a"
	else
		index = vowels.index(letter)
		return vowels[index + 1]
	end
end
# p next_vowel("u")

def fake_name(full_name)
	# split the full name by whitespace into an array and switch first and second name
	name = full_name.split(" ").reverse
	# convert everything into lower case
	name.map! do |name|
		name.downcase
	end
	# split the first name into array of letters
	first_name = name[0].split("")
	# apply next_vowel and next_consonant on the new first name
	first_name.map! do |letter|
		if "aeiou".include? letter
			next_vowel(letter)
		else
			next_consonant(letter)
		end
	end
	# split the last name into array of letters
	last_name = name[1].split("")
	# apply next_vowel and next_consonant on the new last name
	last_name.map! do |letter|
		if "aeiou".include? letter
			next_vowel(letter)
		else
			next_consonant(letter)
		end
	end
	new_name = [
		first_name.join(""),
		last_name.join("")
	]
	# capitalize the name back
	new_name.map! do |name|
		name.capitalize
	end
	# return the new name by joining first and last name
	return new_name.join(" ")
end
# p fake_name("Felicia Torres")

# User interface:
puts "Enter full names to disguise. (Enter 'quit' to quit)"
quit = false
agents = {}
while quit != true
	name = gets.chomp
	if name == "quit"
		puts "You have quitted the program."
		quit = true
	else
		fake_name = fake_name(name)
		agents[name] = fake_name
		puts "Real name is #{name}. Fake name is #{fake_name}."
	end
end
# print out the results
agents.each do |real_name, fake_name|
	puts "#{fake_name} is actually #{real_name}."
end
