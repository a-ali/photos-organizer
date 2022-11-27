# frozen_string_literal: true

require 'organizer/city_organizer'
require 'resource/photo'
require 'resource/city'

RSpec.describe Organizer::CityOrganzier do
  describe '.organize_photos!' do
    it 'renames photos by city' do
      city1 = Resource::City.new(name: 'Krakow')
      city2 = Resource::City.new(name: 'Bali')
      now = DateTime.now
      photos = [
        Resource::Photo.new(name: 'me', extension: 'png', city: city1, date: now),
        Resource::Photo.new(name: 'me', extension: 'jpg', city: city2, date: now),
        Resource::Photo.new(name: 'downtown', extension: 'png', city: city1, date: now + 10),
        Resource::Photo.new(name: 'downtown-cafe', extension: 'png', city: city1, date: now - 100),
        Resource::Photo.new(name: 'sea', extension: 'png', city: city2, date: now + 10)
      ]

      described_class.organize_photos!(photos)

      expect(photos[3].name).to eq("#{city1.name}1")
      expect(photos[0].name).to eq("#{city1.name}2")
      expect(photos[2].name).to eq("#{city1.name}3")

      expect(photos[1].name).to eq("#{city2.name}1")
      expect(photos[4].name).to eq("#{city2.name}2")
    end
  end
end
