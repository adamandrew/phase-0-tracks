class Santa
	attr_reader :ethnicity, :reindeer_ranking
	attr_accessor :gender, :age

	def initialize(gender, ethnicity)
		puts "Initializing Santa instance ..."
		@gender = gender
		@ethnicity = ethnicity
		@age = 0
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!"
	end

	def celebrate_birthday
		@age += 1
	end

	def get_mad_at(reindeer)
		@reindeer_ranking.delete(reindeer)
		@reindeer_ranking << reindeer
	end

	def about
		puts "Gender: #{@gender}, Ethnicity: #{ethnicity}, Age: #{@age}."
	end
end

# santa = Santa.new
# santa.speak
# santa.eat_milk_and_cookies("chocolate chip cookie")

# santas = []
# santas << Santa.new("agender", "black")
# santas << Santa.new("female", "Latino")
# santas << Santa.new("bigender", "white")
# santas << Santa.new("male", "Japanese")
# santas << Santa.new("female", "prefer not to say")
# santas << Santa.new("gender fluid", "Mystical Creature (unicorn)")
# santas << Santa.new("N/A", "N/A")
# puts santas[0].gender
# puts santas[1].ethnicity
# p santas[2].age
# santas[2].celebrate_birthday
# p santas[2].age
# p santas[3].reindeer_ranking
# santas[3].get_mad_at("Vixen")
# p santas[3].reindeer_ranking

santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

500.times do |i|
  random_santa = Santa.new(example_genders.sample, example_ethnicities.sample)
  random_santa.age = rand(140)
  random_santa.about
end