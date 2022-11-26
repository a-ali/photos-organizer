# frozen_string_literal: true

$LOAD_PATH.unshift("#{__dir__}/lib")

require 'parser/string_parser'
require 'photos_organizer'
require 'organizer/city_organizer'

photos = File.read('files/photos.txt')
parser = Parser::StringParser.new(photos)
organizer = Organizer::CityOrganzier
app = PhotosOrganizer.new(parser:, organizer:)

puts 'Input:'
app.photos.each do |photo|
  puts "\t#{photo}"
end

puts 'Output:'
app.organize_photos!
app.photos.each do |photo|
  puts "\t#{photo}"
end
