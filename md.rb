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



