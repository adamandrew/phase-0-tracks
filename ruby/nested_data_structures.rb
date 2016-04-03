# nested data structure of 3 test grades in different class for each student
grades = {
	Math: {
		"Bob" => [80, 74, 85],
		"Jeff" => [56, 40, 50],
		"Wayne" => [90, 100, 98]
	},
	English: {
		"Peter" => [84, 76, 98],
		"Sam" => [76, 70, 81]
	}
}

# Want all the test grades in English class
p grades[:English]

# Want Bob's second test grade in math class
p grades[:Math]["Bob"][1]

# Peter's third test grade in English class was keyed in wrong, it should be 95
grades[:English]["Peter"][2] = 95
p grades[:English]["Peter"]

# Jeff just took the fourth test in Math class and got a 84
grades[:Math]["Jeff"] << 84
p grades[:Math]["Jeff"]

# We forgot to put George's grade in English class in
grades[:English]["George"] = [84, 79, 86]
p grades[:English]