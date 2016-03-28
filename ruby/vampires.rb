puts "How many employees?"
number_employees = gets.chomp.to_i

# offer surveys to number of employees
number_employees.times do
	puts "What is your name?"
	name = gets.chomp
	puts "How old are you?"
	age = gets.chomp.to_i
	puts "What year were you born?"
	year = gets.chomp.to_i
	puts "Our company cafeteria serves garlic bread. Should we order some for you?"
	garlic_answer=gets.chomp
	if garlic_answer == "yes"
		hate_garlic = false
	else
		hate_garlic = true
	end
	puts "Would you like to enroll in the company's health insurance?"
	insurance_answer = gets.chomp
	if insurance_answer == "yes"
		need_insurance = true
	else
		need_insurance = false
	end

	# ask for some allergies
	puts "Name some allergies. (enter 'done' when done)"
	allergy = ""
	# continue to let the user enter allergies until the user enters done or sunshine
	while allergy != "done" && allergy != "sunshine"
		allergy = gets.chomp
	end
	# if the user enters sunshine, he is probably a vampire
	if allergy == "sunshine"
		puts "Probably a vampire."
	# if not, use the rest of the survey to check if he is a vampire
	else
		if age == (2016 - year) && hate_garlic == false && need_insurance == true
			puts "Probably not a vampire."
		elsif age != 2016 - year && hate_garlic == true && need_insurance == true
			puts "Probably a vampire."
		elsif age != 2016 - year && hate_garlic == false && need_insurance == false
			puts "Probably a vampire."
		elsif age != 2016 - year && hate_garlic == true && need_insurance == false
			puts "Almost certainly a vampire."
		elsif name == "Drake Cula" || name == "Tu Fang"
			puts "Definitely a vampire."
		else
			puts "Result inconclusive."
		end
	end
end

puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."