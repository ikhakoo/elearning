# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Course.delete_all
Enrollment.delete_all
User.delete_all
Lesson.delete_all
Step.delete_all

User.create!(
  first_name: "David",
  last_name: "Banner",
  email: "Bannerd@bitmakerlabs.com",
  password: 'password',
  password_confirmation: 'password',
  role: "admin"
)

User.create!(
  first_name: "me",
  last_name: "me",
  email: "me@me.com",
  password: 'password',
  password_confirmation: 'password',
  role: "student"
)

50.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    role: "student"
  )
  print '|'
end

3.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password',
    role: "instructor"
  )
  print '|'
end

puts
puts "Users seeded."

names  = ["Web Development Immersive", "Intro to Git and Github",
  "Bashment Time: Learning Unix command line", "Front-End with JavaScript", "Dev Ops Technology"]
prices = ["9000", "2000", "2000", "5000", "3000"]
descriptions = ["Everything you need to know to be become a professional web developer and launch your own start-up",
  "Learning the essentials of version control", "Embrace the power of the command line", "Style away with JS, HTML, and CSS",
  "Learn back-end and web hosting technology"]

x = ["|","/","-","+","#"]
i = 0
5.times do
    Course.create!(
      name: names[i],
      price: prices[i],
      description: descriptions[i]
  	)
    i+=1
    print x.shuffle.sample
end
puts "Course Seed Complete"

# courses = Course.all
# courses.each do |course|
#   order = 1
#   rand(6..10).times do
#     Lesson.create!(
#       name: Faker::Lorem.sentence,
#       description: Faker::Lorem.paragraph,
#       course_id: course.id,
#       lesson_order: order
#       )
#     order += 1
#   end
# end

students = User.where(role: "student")

60.times do
  Enrollment.create!(
    course_id: courses.sample.id,
    user_id: students.sample.id
  )
  x = ["|","/","-","+","#"]
  print x.shuffle.sample
end

puts "Enrollments seeded."

# progress for dummy user
all_students_of_first_course = Course.first.users
all_students_of_first_course.each do |student|
  Step.create!(
    lesson_id: Course.first.lessons.where(lesson_order: 1)[0].id, #Ugliest code ever written!!!
    user_id: student.id,
    completed: true
    )
  print "^"
end

puts "Progress (Steps) seeded."

puts "Succesfully Registered For Courses ... Time To Get Rich Bitch!"


