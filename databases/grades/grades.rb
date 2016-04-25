# Manage students' grades in a database!

require 'sqlite3'

# create database
db = SQLite3::Database.new("grades.db")
db.results_as_hash = true