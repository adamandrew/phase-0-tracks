# require gems
require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
# get '/students' do
#   students = db.execute("SELECT * FROM students")
#   response = ""
#   students.each do |student|
#     response << "ID: #{student['id']}<br>"
#     response << "Name: #{student['name']}<br>"
#     response << "Age: #{student['age']}<br>"
#     response << "Campus: #{student['campus']}<br><br>"
#   end
#   response
# end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# route to contact information
get '/contact' do
  "1234 Some Street, San Francisco, CA"
end

# route that gets a good job message
# can take name as a query parameter
get '/great_job' do
  name = params[:name]
  if name
    "Good job, #{name}!"
  else
    "Good job!"
  end
end

# route that gets the sum of two number
get '/add/:num1/:num2' do
  sum = params[:num1].to_i + params[:num2].to_i
  sum.to_s
end

# display student list
def display_students(students)
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# route that retrieves filtered student list
# with query parameter 'name', 'id', or 'campus'
get '/students' do
  name = params[:name]
  id = params[:id]
  campus = params[:campus]
  if name
    students = db.execute("SELECT * FROM students WHERE name=?", [name])
    display_students(students)
  elsif id
    students = db.execute("SELECT * FROM students WHERE id=?", [id])
    display_students(students)
  elsif campus
    students = db.execute("SELECT * FROM students WHERE campus=?", [campus])
    display_students(students)
  else
    students = db.execute("SELECT * FROM students")
    display_students(students)
  end
end