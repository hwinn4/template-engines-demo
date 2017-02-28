# ruby app.rb
require 'sinatra'

class Students
  STUDENTS = [
      { first: 'Ahmed', last: 'Abdalla' },
      { first: 'David' , last: 'Amato' },
      { first: 'Evelyn', last: 'Ariza' },
      { first: 'Meagan', last: 'Carioti'}
    ]
end

class Student
  attr_reader :first, :last

  def initialize(student_hash)
    @first = student_hash[:first]
    @last = student_hash[:last]
  end

  def grad_year
    2017
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