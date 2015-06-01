# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def destroy_that_shit
  Course.delete_all
  print "Blowing "
  Enrollment.delete_all
  print "That "
  User.delete_all
  print "Shit "
  Lesson.delete_all
  print "Up "
  Step.delete_all
  print "Son"
  Chapter.delete_all
  print "!"
  puts
end

def seed_that_shit
  puts "Loading Users..."

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

  User.create!(
    first_name: "daniel",
    last_name: "dvorkin",
    email: "daniel@dvorkin.com",
    password: 'password',
    password_confirmation: 'password',
    role: "student"
  )

  50.times do |w|
    User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'password',
      password_confirmation: 'password',
      role: "student"
    )
    print w
    print 13.chr
  end

  User.create!(
    first_name: "Pete",
    last_name: "Moss",
    email: "extreme_moss@what.com",
    password: 'password',
    password_confirmation: 'password',
    role: "instructor"
  )


  puts
  puts "Users seeded."

  names  = [
    "Web Development",
    "Intro to Git and Github",
    "Bashment Time: Learning Unix command line",
    "Front-End with JavaScript",
    "Dev Ops Technology"
  ]
  prices = ["9000", "2000", "2000", "5000", "3000"]
  descriptions = [
    "Everything you need to know to be become a professional web developer and launch your own start-up",
    "Learning the essentials of version control", "Embrace the power of the command line",
    "Style away with JS, HTML, and CSS", "Learn back-end and web hosting technology"
  ]

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

  puts
  puts "Course Seed Complete"

  courses = Course.all
  students = User.where(role: "student")
  60.times do
    course_id = courses.sample.id
    user_id = students.sample.id
    if Enrollment.where(course_id: course_id, user_id: user_id).empty?
      Enrollment.create!(
        course_id: course_id,
        user_id: user_id
      )
      print '|'
    end
  end

  puts
  puts "Enrollments seeded."

end


def marking_it_down

  puts "Loading markdown files..."

  course = Course.first

  x1 = "What a web developer really does"
  x2 = "The tools of the trade"
  x3 = "How to get hired as a web developer"

  names = ["1. Introduction to Web Development",
          "2. Web Development 101",
          "3. Ruby Programming",
          "4. Ruby on Rails",
          "5. HTML5 and CSS3",
          "6. Javascript and jQuery",
          "7. Getting Hired as a Web Developer"]

  descriptions =
  ["This course will start from zero, answering the basic questions people have about the actual practice and career of web development. You'll gain a much better understanding of what you're about to get into!",
    "This course is for anyone who is either starting from scratch or who isn't entirely comfortable with their understanding of the command line, HTML, CSS, Javascript, Ruby, web frameworks, Git, or other foundational technologies of web development. We cover a LOT of ground -- by the end of this comprehensive course, you'll be well prepared to take on our deep dive courses or explore further on your own.",
    "Once you've completed Web Development 101, this course will take you deep into the wonderful world of Ruby. You'll learn a combination of programming fundamentals and best practices and you will get the chance to build a variety of different projects along the way.",
    "Now that you've got a good grounding in Ruby, it's time to put that to work by learning how to rapidly develop websites using Ruby on Rails. By the end of this course, you'll be able to build and deploy a real website with confidence. In fact, you'll do it many times.",
    "Now that you're a pro in building website back ends, it's time to take a good hard look at the front end so your sites will stop looking like ugly ducklings and you can really begin to understand the DOM. This shorter course will give you the tools to stop fighting with your CSS and start building more logically designed sites.",
    "The last component in your web development arsenal is the ability to make your front ends dynamically react to the user. In this course you'll learn how to use Javascript and jQuery to interact with the DOM and make things like dropdown menus, parallax scroll effects, single page applications, and even games. It will tie together everything you've learned already into one awesome package.",
    "You've come extremely far and are now a capable web developer, but, as you've probably realized, the journey of discovery has only just begun. Luckily, you're now useful enough that others will pay you to keep building and learning. . . and in this short course, we'll show you how to make that happen."]

  i = 0
  5.times do
    course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: course.id,
      will_learn: "#{x1}\n#{x2}\n#{x3}",
      will_build: "Hold on, you'll be building soon!",
      lesson_order: i+1
    )
    i+=1
  end

  all_lessons = course.lessons.all
  lesson_number = 1
  w = 1
  all_lessons.each do |lesson|
    file_paths = Dir.glob("lib/curriculum/lesson_#{lesson_number}/*.md")

    file_paths.each do |file_path|

      page = File.open(file_path, 'r') { |f| f.read }

      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
      markdown_to_html = markdown.render(page)

      chapter_name = file_path.split("/").last.gsub(".md", "").titleize
      lesson.chapters.create!(title: chapter_name, content: markdown_to_html)
      print w
      print 13.chr
      w = w + 1
    end
    lesson_number+=1
  end

  puts
  puts "Markdown loading complete."

end


destroy_that_shit
seed_that_shit
marking_it_down






