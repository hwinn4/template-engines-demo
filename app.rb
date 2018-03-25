# ruby app.rb
require 'sinatra'

class Students
  STUDENTS = [
      { first: 'Ahmed', last: 'Abdalla', grad_year: 2017 },
      { first: 'David' , last: 'Amato', grad_year: 2017 },
      { first: 'Evelyn', last: 'Ariza', grad_year: 2017 },
      { first: 'Dakarai', last: 'Arnold', grad_year: 2018 },
      { first: 'Meagan', last: 'Carioti', grad_year: 2017 },
      { first: 'Abdel', last: 'Khedr', grad_year: 2018 },
      { first: 'Christy', last: 'Li', grad_year: 2018 },
      { first: 'Kathleen', last: 'Saloma', grad_year: 2018 },
    ]
end

class Student
  attr_reader :first, :last, :grad_year

  def initialize(student_hash)
    puts student_hash
    @first = student_hash[:first]
    @last = student_hash[:last]
    @grad_year = student_hash[:grad_year]
  end
end

get '/' do
  @students = []

  Students::STUDENTS.each do |stu|
    @students << Student.new(stu)
  end

  erb :index
end

get '/haml' do
  @students = []

  Students::STUDENTS.each do |stu|
    @students << Student.new(stu)
  end

  haml :haml
end

get '/slim' do
  @students = []

  Students::STUDENTS.each do |stu|
    @students << Student.new(stu)
  end

  slim :slim
end