# require gems
require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

get '/student/delete' do
	erb :student_delete
end
#add static resources
post '/student/deleted' do
	db.execute("DELETE FROM students WHERE name = ?", [params[:name]])
	" #{params[:name]} has been deleted"
end

get '/student/age' do
	erb :change_age
end

post '/student/agechanged' do
	db.execute("UPDATE students SET age=? WHERE name=?", [params[:new_age],params[:name]])
	"#{params[:name]} is now #{params[:new_age]} years old."
end
