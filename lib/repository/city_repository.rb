# frozen_string_literal: true

require_relative 'base_repository'
require 'resource/city'

module Repository
  class CityRepository < BaseRepository
    def self.find_or_create_by(name:)
      record = store.find_by(name:)
      return record if record

      city = Resource::City.new(name:)
      store.create(city)
      city
    end
  end
end
