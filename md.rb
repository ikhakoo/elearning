require 'pry'
require 'nokogiri'

x = Nokogiri::XML(File.open("/lib/curriculum/getting_hired_as_web_dev.md"))

puts x

binding.pry