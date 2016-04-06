class Puppy
	def initialie
		puts "Initializing new puppy instance ..."
	end

	def fetch(toy)
		puts "I brought back the #{toy}!"
		toy
	end

	def speak(int)
    	puts "Woof! " * int
	end

	def roll_over
    	puts "​*rolls over*​"
	end

	def dog_years(human_years)
    	human_years / 7
	end

	def play_dead
    	puts "nothing"
	end
end

class Cat
	def initialize
    	puts "Initializing you cat instance!!!"
	end

	def speak
    	puts "meow!"
	end

	def scratch(times)
    	puts "|"*times
	end

	def sleep
    	puts "prrr..."
	end
end


=begin
pup = Puppy.new
pup.fetch("Ball")
pup.speak(4)
pup.roll_over
puts pup.dog_years(43)
pup.play_dead
=end

cats = []

50.times do 
	cats << Cat.new
end

cats.each_index do |index|
	cat = cats[index]
	cat.speak
	cat.scratch(index+1)
	cat.sleep
end
