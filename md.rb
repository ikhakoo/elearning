require 'pry'
require 'nokogiri'

f = File.open("/Users/sump/Desktop/bitmakerlabs/elearning/lib/curriculum/getting_hired_as_web_dev.md")
doc = Nokogiri::XML(f)

binding.pry

puts 'yolo'