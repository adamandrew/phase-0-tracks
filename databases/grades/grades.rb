# Manage students' grades in a database!

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
def update_grade(database, student_id, subject_id, grade)
	database.execute("UPDATE grades SET grade=? WHERE student_id=? AND subject_id=?",[grade, student_id, subject_id])
end

# update_grade(db, 1, 1, 75)

# method to get student id
def get_student_id(database, name)
	student = database.execute("SELECT * FROM students WHERE name=?",[name])
	student_id = student[0][0]
end

# p get_student_id(db, "Bob")

# method to get subject id
def get_subject_id(database, name)
	subject = database.execute("SELECT * FROM subjects WHERE name=?",[name])
	subject_id = subject[0][0]
end

# p get_subject_id(db, "Math")

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

