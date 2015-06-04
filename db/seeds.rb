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
  Chapter.delete_all
  print "!"
end

def seed_that_shit

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
  puts ""
  puts "Users seeded."

  # names  = [
  #   "Web Development", 
  #   "Intro to Git and Github",
  #   "Bashment Time: Learning Unix command line", 
  #   "Front-End with JavaScript", 
  #   "Dev Ops Technology"
  # ]
  # prices = ["9000", "2000", "2000", "5000", "3000"]
  # descriptions = [
  #   "Everything you need to know to be become a professional web developer and launch your own start-up",
  #   "Learning the essentials of version control", "Embrace the power of the command line", 
  #   "Style away with JS, HTML, and CSS", "Learn back-end and web hosting technology"
  # ]

  # x = ["|","/","-","+","#"]
  # i = 0
  # 5.times do
  #     Course.create!(
  #       name: names[i],
  #       price: prices[i],
  #       description: descriptions[i]
  #   	)
  #     i+=1
  #     print x.shuffle.sample
  # end

  puts "Course Seed Complete"

  puts "Time To Get Rich Bitch!"

end

# def marking_it_down(file_path)
#   begin
#     page = File.open(File.join(file_path), 'r') { |f| f.read }

#     markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
#     @markdown_to_html = markdown.render(page)

#     chapter_name = file_path.split("/").last.gsub(".md", "").titleize
#     Chapter.create!(title: chapter_name, content: @markdown_to_html)
#     print "|"
#   rescue => e
#     puts "Couldn't load: #{file_path}"
#     binding.pry
#   end
# end

def marking_it_down

  @course = Course.create!(
              name: "Web Development 101",
              description: "Learn the fundamentals and industry practises to become a Web Developer."
            )

  x1 = "What a web developer really does"
  x2 = "The tools of the trade"
  x3 = "How to get hired as a web developer"

  names = ["1. Introduction to Web Development",
          "2. The Basics",
          "3. Front End",
          "4. Back End",
          "5. Frameworks",
          "6. Additional Topics",
          "7. Tying It All Together"]
  
  descriptions = 
  [
    "This course will start from zero, answering the basic questions people have about the actual practice and career of web development. You'll gain a much better understanding of what you're about to get into!",
    "This section will cover the baseline knowledge you need before getting into the more 'programming' aspects of web development. You'll also get a chance to install the necessary software on your computer.",
    "In this section you'll spend a good deal of time getting familiar with the major client-side (browser-based) languages like HTML, CSS, and Javascript. You'll get to build a webpage with HTML/CSS and learn some programming fundamentals with Javascript.",
    "Here you'll learn about the back end, where we'll demystify what goes on behind the scenes on a web server. You'll get to take a crack at Ruby, the sublimely awesome language that runs Ruby on Rails.",
    "You've probably heard about 'Ruby on Rails' and 'Backbone.js' and other sleek-sounding development frameworks. In this section, you'll learn what a framework is, why we use them, and get acquainted with the ones we'll be covering in future courses.",
    "This section has a bunch of short lessons that will introduce you to a variety of essential supporting technologies for your journey into web development.",
    "Now that you've had a healthy taste of all the major components in a web application, we'll take a step back and remember where they all fit into the bigger picture."
  ]
  i = 0
  7.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 1,
      lesson_count: i + 1,
      will_learn: "#{x1}\n#{x2}\n#{x3}",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.first

  @file_paths = Dir.glob("lib/curriculum/web_development_101/lesson_1/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(2)

  @file_paths = Dir.glob("lib/curriculum/web_development_101/lesson_2/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(3)

  @file_paths = Dir.glob("lib/curriculum/web_development_101/lesson_3/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(4)

  @file_paths = Dir.glob("lib/curriculum/web_development_101/lesson_4/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(5)

  @file_paths = Dir.glob("lib/curriculum/web_development_101/lesson_5/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(6)

  @file_paths = Dir.glob("lib/curriculum/web_development_101/lesson_6/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(7)

  @file_paths = Dir.glob("lib/curriculum/web_development_101/lesson_7/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

end

def marking_it_down2

  @course = Course.create!(
              name: "Programming with Ruby",
              description: "Learn the fundamentals of command line programming with Ruby!"
            )

  x1 = "What a web developer really does"
  x2 = "The tools of the trade"
  x3 = "How to get hired as a web developer"

  names = ["1. Basic Ruby",
          "2. Intermediate Ruby",
          "3. Ruby on the Web",
          "4. A Bit of Computer Science",
          "5. Testing Ruby with RSpec",
          "6. Git/Github",
          "7. Final Project!"]
  
  descriptions = 
  [
    "In this section, we'll cover the basic building blocks of Ruby so you have them down cold. Everything else you'll learn in programming builds on these concepts, so you'll be in a great place to take on additional projects and languages in the future.",
    "You've got tools in your Ruby tool box and now it's time to combine them into more meaningful programs. In this section, you'll learn how to turn your spaghetti code into properly organized methods and classes. You'll also learn how to serialize code and save it into files.",
    "This brief section will bridge the gap between what you've been doing on the command line and the wide world of the Internet... how do you send automated Tweets? How about building a basic web server and browser of your own!",
    "In this section, you'll learn some fundamental computer science concepts that will help you when solving problems with a bit more complexity than just simple web serving. You get to try on your engineering hat and solve some pretty nifty problems.",
    "You've been briefly introduced to testing in Ruby a couple of times before in the Web Development 101 course, but now you're going to really learn why testing can be hugely helpful and how to apply it to your own projects.",
    "You should be familiar with the basic Git workflow since you've been using it to save your projects along the way (right?!). This section will start preparing you for for the more intermediate-level uses of Git that you'll find yourself doing .",
    "You've come an exceptional distance already, now there's just the matter of wrapping it all together into one coherant package and creating something real. This is your Final Exam and a major feather in your cap. Once you've completed this section, you should have the confidence to tackle pretty much anything."
  ]
  i = 0
  7.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 2,
      lesson_count: i + 1,
      will_learn: "#{x1}\n#{x2}\n#{x3}",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.find(8)

  @file_paths = Dir.glob("lib/curriculum/ruby/lesson_1/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(9)

  @file_paths = Dir.glob("lib/curriculum/ruby/lesson_2/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(10)

  @file_paths = Dir.glob("lib/curriculum/ruby/lesson_3/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(11)

  @file_paths = Dir.glob("lib/curriculum/ruby/lesson_4/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(12)

  @file_paths = Dir.glob("lib/curriculum/ruby/lesson_5/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(13)

  @file_paths = Dir.glob("lib/curriculum/ruby/lesson_6/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(14)

  @file_paths = Dir.glob("lib/curriculum/ruby/lesson_7/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end
end

def marking_it_down3

  @course = Course.create!(
              name: "Ruby on Rails Concepts",
              description: "Learn one of the most flexible frameworks for Web Applications."
            )

  x1 = "What a web developer really does"
  x2 = "The tools of the trade"
  x3 = "How to get hired as a web developer"

  names = [
            "1. Introduction to Rails",
            "2. Routes, Views, Controllers and Assets",
            "3. Databases and Active Record",
            "4. Forms and Authentication",
            "5. Advanced Forms and Active Record",
            "6. APIs, Mailers and Advanced Topics"
          ]
  
  descriptions = 
  [
    "In this section, we'll dive right into Rails and get you building from the start so you have an idea of what (and how) you'll learn going forward. We'll get your feet planted in the right spot and your head pointed the right direction.",
    "Now that you've gotten your feet wet, it's time to start looking carefully into the foundational pieces of the Rails framework. We'll cover the path of an HTTP request from entering your application to returning as an HTML page to the browser.",
    "This section covers the back end of Rails, which is the most important part of the framework. You'll learn about databases and go deep into SQL before applying that knowledge to Rails' fantastic Active Record gem.",
    "This section gets into some of the areas of web apps that are less glamorous than they are important. Forms are your user's window to interact with your application. Authentication is critical for many applications, and you'll build a couple of auth systems from the ground up.",
    "Now it's starting to get fun! Learn how to do more than just find and show your users... you'll learn how to use relationships between models to greatly expand your abilities and how to build web forms with sufficient firepower to achieve your most ambitious goals.",
    "This final section will take you into some of the more interesting sides of the Rails ecosystem which will help you reach beyond your own app and into the lives of your users via email or harness the powers of other apps via their APIs."
  ]
  i = 0
  6.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 3,
      lesson_count: i + 1,
      will_learn: "#{x1}\n#{x2}\n#{x3}",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.find(15)

  @file_paths = Dir.glob("lib/curriculum/rails/lesson_1/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(16)

  @file_paths = Dir.glob("lib/curriculum/rails/lesson_2/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(17)

  @file_paths = Dir.glob("lib/curriculum/rails/lesson_3/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(18)

  @file_paths = Dir.glob("lib/curriculum/rails/lesson_4/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(19)

  @file_paths = Dir.glob("lib/curriculum/rails/lesson_5/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(20)

  @file_paths = Dir.glob("lib/curriculum/rails/lesson_6/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end
end

def marking_it_down4

  @course = Course.create!(
              name: "Intro to HTML5/CSS3",
              description: "Learn CSS and begin to understand some of the more fundamental tenets of good site design."
            )

  x1 = "What a web developer really does"
  x2 = "The tools of the trade"
  x3 = "How to get hired as a web developer"

  names = [
            "1. Basic HTML Page Structure",
            "2. Displaying and Inputting Data",
            "3. CSS3",
            "4. Design and UX",
            "5. Responsive Design and CSS Frameworks",
            "6. Advanced CSS3"
          ]
  
  descriptions = 
  [
    "In this section, we'll cover the whole range of HTML5 so you'll be completely comfortable with putting the right elements in the right places on a page.",
    "Displaying and inputting data are two of your chief duties as a web developer. We'll cover the tools at your disposal, including tables and lists for display and forms for input.",
    "Here we'll cover each of the foundational CSS concepts in greater depth than you probably have before.",
    "If you want to make your websites stop looking like they came from the 1990's, you'll need to gain an understanding for at least the best practices of design and User Experience (UX). Not knowing this stuff is like charging over the next hill without any idea of why you're doing it.",
    "These days you need to make sure your pages display easily on multiple viewport sizes by using fluid layouts and media queries. Luckily there are CSS frameworks like Twitter Bootstrap that can save you a ton of time developing standard pages and which come with responsive functionality for free.",
    "We'll take you beyond the basics of CSS and into a variety of additional topics from how to add some stylistic flair to your elements to using tools like preprocessors to save time and reduce repetition in your code."
  ]
  i = 0
  6.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 4,
      lesson_count: i + 1,
      will_learn: "#{x1}\n#{x2}\n#{x3}",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.find(21)

  @file_paths = Dir.glob("lib/curriculum/html_css/lesson_1/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(22)

  @file_paths = Dir.glob("lib/curriculum/html_css/lesson_2/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(23)

  @file_paths = Dir.glob("lib/curriculum/html_css/lesson_3/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(24)

  @file_paths = Dir.glob("lib/curriculum/html_css/lesson_4/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(25)

  @file_paths = Dir.glob("lib/curriculum/html_css/lesson_5/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(26)

  @file_paths = Dir.glob("lib/curriculum/html_css/lesson_6/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end
end

def marking_it_down5

  @course = Course.create!(
              name: "Let's Learn JavaScript and jQuery!",
              description: "The last component in web development is the ability to make your front ends dynamically react to the user."
            )

  x1 = "What a web developer really does"
  x2 = "The tools of the trade"
  x3 = "How to get hired as a web developer"

  names = [
            "1. The Basics and the Browser",
            "2. Events, Effects and Widgets",
            "3. Deeper into Javascript",
            "4. Advanced Browser Work",
            "5. Better Forms with jQuery and AJAX",
            "6. Linking to APIs and Your Rails Back End",
            "7. Server Side Javascript and Javascript Frameworks",
            "8. Finishing Up with Javascript"
          ]
  
  descriptions = 
  [
    "We'll zoom through the basics of Javascript and how it's used in the browser with jQuery. This where things get really fun, since you get to immediately see everything you're building in the browser. By the end of this section, you'll actually know everything you need to build fun and interesting front-ends but, of course, it's really just the beginning.",
    "Events drive just about everything you'll do with Javascript in the browser. We'll take a closer look at how they work and the kinds of things that they allow you to do.",
    "You can do a lot with just basic Javascript, jQuery and a hacker mindset. But this section will take you deeper into how Javascript is actually doing things and it will give you the tools to produce more advanced functionality for your sites. Some of the previous projects have probably tested the boundaries of your understanding of Javascript, and here we'll fix that.",
    "There's a whole lot more to using Javascript in the browser than just manipulating simple DOM elements with jQuery. If you want to grab data from external sites or your own back end, submit forms, or handle more complicated games, you'll need to dig deeper into how Javascript handles things like callbacks. Here we'll also cover how to build games using HTML5's `<canvas>` element, which lets you use Javascript logic to draw shapes.",
    "In this section you'll learn about AJAX, the technology which allows you to send data from the browser to your web application without needing to refresh the page. It's commonly used with forms, but really represents a whole world of possibility for crafting performant user experiences.",
    "A real web app needs a back end in order to persist its data and do sensitive operations. Here you'll learn how to handle use AJAX to send data requests to your Rails back end. You'll also get a chance to work with external APIs like Google Maps, which is something you'll probably find yourself doing quite frequently as you build your own projects in the future.",
    "This is an **OPTIONAL** section where you will learn about using Javascript to run your server (instead of Ruby) and also about Javascript frameworks which let you build a full website as a single page run by Javascript to create blazing fast user experiences.",
    "You've learned everything you need and all that remains to do is apply that knowledge to a worthy task. In this section, we'll briefly cover how to test Javascript using Jasmine and then get you started with your capstone project so you can show off your range of skills."
  ]
  i = 0
  8.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 5,
      lesson_count: i + 1,
      will_learn: "#{x1}\n#{x2}\n#{x3}",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.find(27)

  @file_paths = Dir.glob("lib/curriculum/javascript/lesson_1/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(28)

  @file_paths = Dir.glob("lib/curriculum/javascript/lesson_2/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(29)

  @file_paths = Dir.glob("lib/curriculum/javascript/lesson_3/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(30)

  @file_paths = Dir.glob("lib/curriculum/javascript/lesson_4/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(31)

  @file_paths = Dir.glob("lib/curriculum/javascript/lesson_5/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(32)

  @file_paths = Dir.glob("lib/curriculum/javascript/lesson_6/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(33)

  @file_paths = Dir.glob("lib/curriculum/javascript/lesson_7/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(34)

  @file_paths = Dir.glob("lib/curriculum/javascript/lesson_8/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end
end

def marking_it_down6

  @course = Course.create!(
              name: "Setting up Your Computer",
              description: "A Step by Step guide to setting up your computer for web development."
            )

  names = [
            "1. Quick Setup Guide"
          ]
  
  descriptions = 
  [
    "We'll guide you through setting up Ruby, Git, Heroku, Sublime Text and much more!"
  ]
  i = 0
  1.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 6,
      lesson_count: i + 1,
      will_learn: "How to setup your machine to be a web developer",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.find(35)

  @file_paths = Dir.glob("lib/curriculum/extra_stuff/installations/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end
end

def marking_it_down7

  @course = Course.create!(
              name: "Learning Sass",
              description: "The goals of this course is to familiarize beginning developers with the CSS preprocessor."
            )

  names = [
            "1. Intro to Sass"
          ]
  
  descriptions = 
  [
    "A Brief Introduction to CSS preprocessor, Sass!"
  ]
  i = 0
  1.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 7,
      lesson_count: i + 1,
      will_learn: "How to setup your machine to be a web developer",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.find(36)

  @file_paths = Dir.glob("lib/curriculum/extra_stuff/additional_resources/learning_sass.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end
end

def marking_it_down8

  @course = Course.create!(
              name: "SublimeText and CLI",
              description: "The goals of this course is to familiarize beginning developers with SublimeText Editor."
            )

  names = [
            "1. Learn to Code with SublimeText Editor"
          ]
  
  descriptions = 
  [
    "A Brief Introduction to SublimeText Editor"
  ]
  i = 0
  1.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 8,
      lesson_count: i + 1,
      will_learn: "How to setup your machine to be a web developer",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.find(37)

  @file_paths = Dir.glob("lib/curriculum/extra_stuff/additional_resources/sublimetext_windows_cli.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end
end

def marking_it_down9

  @course = Course.create!(
              name: "Mobile Development Resources",
              description: "The goals of this course is to provide resources for Mobile Development."
            )

  names = [
            "1. Learn the basics of Mobile Development"
          ]
  
  descriptions = 
  [
    "A Brief Introduction to Mobile Development"
  ]
  i = 0
  1.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 9,
      lesson_count: i + 1,
      will_learn: "How to setup your machine to be a web developer",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.find(38)

  @file_paths = Dir.glob("lib/curriculum/extra_stuff/mobile/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end
end

def marking_it_down10

  @course = Course.create!(
              name: "Pair Programming",
              description: "The goals of this course is to improve your pair programming skills."
            )

  names = [
            "1. Learn about the benefits and the how-to's for Pair Programming"
          ]
  
  descriptions = 
  [
    "Pair Programming: An important aspect of working on a development team."
  ]
  i = 0
  1.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 10,
      lesson_count: i + 1,
      will_learn: "How to setup your machine to be a web developer",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.find(39)

  @file_paths = Dir.glob("lib/curriculum/extra_stuff/pairing/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end
end

def marking_it_down11

  @course = Course.create!(
              name: "Web Development Immersive",
              description: "Learn the fundamentals and industry practises to become a Web Developer."
            )

  x1 = "What a web developer really does"
  x2 = "The tools of the trade"
  x3 = "How to get hired as a web developer"

  names = ["1. Introduction to Web Development",
          "2. The Basics",
          "3. Front End",
          "4. Back End",
          "5. Frameworks",
          "6. Additional Topics",
          "7. Tying It All Together"]
  
  descriptions = 
  [
    "This course will start from zero, answering the basic questions people have about the actual practice and career of web development. You'll gain a much better understanding of what you're about to get into!",
    "This section will cover the baseline knowledge you need before getting into the more 'programming' aspects of web development. You'll also get a chance to install the necessary software on your computer.",
    "In this section you'll spend a good deal of time getting familiar with the major client-side (browser-based) languages like HTML, CSS, and Javascript. You'll get to build a webpage with HTML/CSS and learn some programming fundamentals with Javascript.",
    "Here you'll learn about the back end, where we'll demystify what goes on behind the scenes on a web server. You'll get to take a crack at Ruby, the sublimely awesome language that runs Ruby on Rails.",
    "You've probably heard about 'Ruby on Rails' and 'Backbone.js' and other sleek-sounding development frameworks. In this section, you'll learn what a framework is, why we use them, and get acquainted with the ones we'll be covering in future courses.",
    "This section has a bunch of short lessons that will introduce you to a variety of essential supporting technologies for your journey into web development.",
    "Now that you've had a healthy taste of all the major components in a web application, we'll take a step back and remember where they all fit into the bigger picture."
  ]
  i = 0
  7.times do
    @course.lessons.create!(
      name: names[i],
      description: descriptions[i],
      course_id: 1,
      lesson_count: i + 1,
      will_learn: "#{x1}\n#{x2}\n#{x3}",
      will_build: "Hold on, you'll be building soon!"
    )
    i+=1
  end

  @lesson = @course.lessons.find(40)

  @file_paths = Dir.glob("lib/web_dev_immersive/lesson_1/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(41)

  @file_paths = Dir.glob("lib/web_dev_immersive/lesson_2/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(42)

  @file_paths = Dir.glob("lib/web_dev_immersive/lesson_3/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(43)

  @file_paths = Dir.glob("lib/web_dev_immersive/lesson_4/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(44)

  @file_paths = Dir.glob("lib/web_dev_immersive/lesson_5/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(45)

  @file_paths = Dir.glob("lib/web_dev_immersive/lesson_6/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

  @lesson = @course.lessons.find(46)

  @file_paths = Dir.glob("lib/web_dev_immersive/lesson_7/*.md")

  @file_paths.inject(1) do |chapter_count, file_path| 

    page = File.open(File.join(file_path), 'r') { |f| f.read }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)
    @markdown_to_html = markdown.render(page)

    chapter_name = file_path.split("/").last.gsub(".md", "").titleize
    @lesson.chapters.create!(title: chapter_name, content: @markdown_to_html, chapter_count: chapter_count)
    print "|"
    chapter_count + 1
  end

end
 



destroy_that_shit
seed_that_shit
# lessons_do_it
# Dir.glob("lib/curriculum/*/*.md").each {|file_path| marking_it_down(file_path)}
# Dir.glob("lib/curriculum/lesson_1/*.md").each {|file_path| marking_it_down1(file_path)}
# Dir.glob("lib/curriculum/lesson_2/*.md").each {|file_path| marking_it_down2(file_path)}
marking_it_down
marking_it_down2
marking_it_down3
marking_it_down4
marking_it_down5
marking_it_down6
marking_it_down7
marking_it_down8
marking_it_down9
marking_it_down10
marking_it_down11





