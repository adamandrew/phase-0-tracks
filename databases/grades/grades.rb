# Manage students' grades in a database!

require 'sqlite3'

# create database
db = SQLite3::Database.new("grades.db")
db.results_as_hash = true

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

add_subject(db, "Math")
add_subject(db, "English")
add_subject(db, "Physics")
add_subject(db, "Art")
add_subject(db, "Chemistry")