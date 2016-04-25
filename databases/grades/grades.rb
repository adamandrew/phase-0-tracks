# Manage students' grades in a database!

# This programe let the user insert grades for students
# There is no error detection in this program due to time constraint
# All the commands only work if user type in correct commands and inputs
# Something will break if you enter wrong input

require 'sqlite3'

# create database
db = SQLite3::Database.new("grades.db")

create_students_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS students(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255)
	)
SQL

create_subjects_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS subjects(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255)
	)
SQL

create_grades_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS grades(
		id INTEGER PRIMARY KEY,
		grade INT,
		student_id INT,
		subject_id INT,
		FOREIGN KEY (student_id) REFERENCES students(id),
		FOREIGN KEY (subject_id) REFERENCES subjects(id)
	)
SQL

db.execute(create_students_table_cmd)
db.execute(create_subjects_table_cmd)
db.execute(create_grades_table_cmd)

# method to add a student
def add_student(database, name)
	database.execute("INSERT INTO students (name) VALUES (?)", [name])
end
# add_student(db, "Bob")

# methoad to add a subject
def add_subject(database, name)
	database.execute("INSERT INTO subjects (name) VALUES (?)", [name])
end
# add_subject(db, "Math")
# add_subject(db, "English")
# add_subject(db, "Physics")
# add_subject(db, "Art")
# add_subject(db, "Chemistry")

# method to add a grade
def add_grade(database, student_id, subject_id, grade)
	database.execute("INSERT INTO grades (grade, student_id, subject_id) VALUES (?, ?, ?)", [grade, student_id, subject_id])
end
# add_grade(db, 1, 1, 80)

# method to update a grade
def update_grade(database, student, subject, grade)
	student_id = get_student_id(database, student)
	subject_id = get_subject_id(database, subject)
	database.execute("UPDATE grades SET grade=? WHERE student_id=? AND subject_id=?",[grade, student_id, subject_id])
end
# update_grade(db, 1, 1, 75)

# method to get student id
def get_student_id(database, name)
	student = database.execute("SELECT * FROM students WHERE name=?",[name])
	student_id = student[0][0].to_i
end
# p get_student_id(db, "Bob")

# method to get subject id
def get_subject_id(database, name)
	subject = database.execute("SELECT * FROM subjects WHERE name=?",[name])
	subject_id = subject[0][0].to_i
end
# p get_subject_id(db, "Math")

# method to display all students
def display_students(database)
	students = database.execute("SELECT * FROM students")
	students.each do |student|
		puts "ID: #{student[0]} Name: #{student[1]}"
	end
end
# display_students(db)

# method to display all subjects
def display_subjects(database)
	subjects = database.execute("SELECT * FROM subjects")
	subjects.each do |subject|
		puts "ID: #{subject[0]} Subject: #{subject[1]}"
	end
end

# method to display all grades
def display_grades(database, name)
	student_id = get_student_id(database, name)
	display_cmd= <<-SQL
		SELECT students.name, subjects.name, grades.grade
		FROM grades
			JOIN students
				ON grades.student_id=students.id
			JOIN subjects
				ON grades.subject_id=subjects.id
		WHERE student_id=?
	SQL
	display = database.execute(display_cmd,[student_id])
	display.each do |grade|
		puts "#{grade[0]} scored a #{grade[2]} on #{grade[1]}."
	end
end
# display_grades(db, "Bob")

# Method to print out the commands
def help
	puts "-to add new student: add student"
	puts "-to display all students: display students"
	puts "-to display all subjects: display subjects"
	puts "-to update a grade: update grade"
	puts "-to display grades of a student: check grade"
	puts "-to quit: done, exit"
end

# USER INTERFACE
puts "Welcome to grade manager. Please enter inputs. (type 'help' to see all commands)"
done = false
while done == false do
	input = gets.chomp
	if input == "help"
		help
	elsif input == "add student"
		puts "What is the student's name?"
		name = gets.chomp
		add_student(db, name)
		student_id = get_student_id(db, name)
		puts "Grade in Math?"
		grade = gets.chomp.to_i
		add_grade(db, student_id, 1, grade)
		puts "Grade in English?"
		grade = gets.chomp.to_i
		add_grade(db, student_id, 2, grade)
		puts "Grade in Physics?"
		grade = gets.chomp.to_i
		add_grade(db, student_id, 3, grade)
		puts "Grade in Art?"
		grade = gets.chomp.to_i
		add_grade(db, student_id, 4, grade)
		puts "Grade in Chemisty?"
		grade = gets.chomp.to_i
		add_grade(db, student_id, 5, grade)
		display_grades(db, name)
	elsif input == "display students"
		display_students(db)
	elsif input == "display subjects"
		display_subjects(db)
	elsif input == "update grade"
		puts "What is the student's name?"
		name = gets.chomp
		puts "Which subject? (Math, English, Physics, Art, Chemistry)"
		subject = gets.chomp
		puts "What is the new grade?"
		grade = gets.chomp.to_i
		update_grade(db, name, subject, grade)
	elsif input == "check grade"
		puts "What is the student's name?"
		name = gets.chomp
		display_grades(db, name)
	elsif input == "done" || input == "exit"
		done = true
	end
end
		


# add_subject(db, "Math")
# add_subject(db, "English")
# add_subject(db, "Physics")
# add_subject(db, "Art")
# add_subject(db, "Chemistry")