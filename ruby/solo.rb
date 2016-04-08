# Pseudocode of Fruit class
=begin
Fruit class has attribues:
	- taste: string
	- color: string
	- days until expired: integer (only readable - don't want anybody fiddling with expired fruit)
Fruit class has methods:
	- about method that prints the attributes of the fruit
	- eat method that eats the fruit and prints the taste
	- store method that takes a number as argument and decrease the day_until_expired by the number
=end

class Fruit
	attr_reader :days_until_expired
	attr_accessor :taste, :color

	def initialize(taste, color, days_until_expired)
		@taste = taste
		@color = color
		@days_until_expired = days_until_expired
	end

	def about
		print "This fruit tastes #{@taste}. "
		print "This fruit is #{@color}. "
		if @days_until_expired > 0
			puts "This fruit goes bad in #{@days_until_expired} days."
		else
			puts "This fruit has already gone bad!"
		end
	end

	def eat
		if @days_until_expired <= 0
			puts "Ewww! This fruit has gone bad!"
		else
			puts "Mmmm. This fruit tastes #{@taste}."
		end
	end

	def store(days)
		@days_until_expired -= days
		if @days_until_expired <= 0
			@taste = "bad"
		end
	end
end
# apple = Fruit.new("sweet", "red", 10)
# apple.about
# apple.store(7)
# apple.about
# apple.store(4)
# apple.about
# apple.eat

# User Interface
puts "Create some fruits."
fruits = []
continue = true
while continue == true
	puts "What taste is the fruit?"
	taste = gets.chomp
	puts "What color is the fruit?"
	color = gets.chomp
	puts "How many days until expired?"
	days_until_expired = gets.chomp.to_i
	fruits << Fruit.new(taste, color, days_until_expired)
	puts "Do you want to create more fruits?"
	create_more = gets.chomp
	if create_more == "no"
		continue = false
	elsif create_more == "yes"
		continue = true
	else
		puts "I assume you want to continue if you don't say 'yes' or 'no'."
	end
end
fruits.each do |fruit|
	fruit.about
end