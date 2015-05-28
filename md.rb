require 'pry'
require 'redcarpet'

page = File.open(File.join("lib/curriculum/getting_hired_as_web_dev.md"), 'r') { |f| f.read }

# puts page

# initialize a Markdown parser
markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true)

# render method called
# rendering html returned from markdown.render
# render html: markdown.render(page).html_safe #(File.join(Rails.root, 'lib', 'curriculum', "#{params[:page_id]}.md"))
@markdown_to_html = markdown.render(page)

binding.pry

puts @markdown_to_html

<p id="notice"><%= notice %></p>
<div style="text-align:center;">
  <h1 style="text-align:center;">Listing Lessons</h1>
  <% if current_user.role == 'admin' || current_user.role == 'instructor' %>
    <%= link_to 'New Lesson', new_course_lesson_path(@course), class: "ui button" %>
  <% end %>
</div>

<div class="ui grid">
  <div class="two wide column">
    <%= render 'dashboard/left_sidebar' %>
  </div>
  <div class="twelve wide column center aligned">
    <div class="ui segment">
      <% @lessons.each do |lesson| %>
        <h2>Name: <%= lesson.name %></h2>
        <% if lesson.video_id.nil? %>
        <% else %>
        <iframe width="550" height="315" src="https://www.youtube.com/embed/<%= lesson.video_id %>" frameborder="0" allowfullscreen></iframe>
        <% end %>
        <p><strong>Description: </strong><%= lesson.description %></p>
        <% if current_user.role == 'admin' || current_user.role == 'instructor' %>
          <p><%= link_to 'Show', course_lesson_path(@course, lesson) %></p>
          <p><%= link_to 'Edit', edit_course_lesson_path(@course, lesson) %></p>
          <p><%= link_to 'Destroy', course_lesson_path(@course, lesson), method: :delete, data: { confirm: 'Are you sure?' } %></p>
        <% end %>
    </div>
    <% end %>
  </div>
</div>

