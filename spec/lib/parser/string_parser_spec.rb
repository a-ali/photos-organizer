# frozen_string_literal: true

require 'parser/string_parser'
require 'resource/photo'
require 'resource/city'

RSpec.describe Parser::StringParser do
  it 'parses photos from a string' do
    input = 'pisatower.jpg, city, 2020-01-01 23:59:59; BOB.jpg, city, 2020-01-01 23:59:59'
    parser = described_class.new(input, separator: ';')
    photos = parser.photos
    city = Resource::City.new(name: 'city')
    time = DateTime.new(2020, 1, 1, 23, 59, 59)

    photo1 = Resource::Photo.new(name: 'pisatower', extension: '.jpg', city:, date: time)
    photo2 = Resource::Photo.new(name: 'BOB', extension: '.jpg', city:, date: time)

    expect(photos[0]).to eq(photo1)
    expect(photos[1]).to eq(photo2)
  end
end
