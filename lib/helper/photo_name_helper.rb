# frozen_string_literal: true

require 'repository/city_repository'
require 'date'

# Parses given photo name into name, city, and date
module Helper
  module PhotoNameHelper
    SEPARATOR = ','
    DATE_FORMAT = '%Y-%m-%d %H:%M:%S'

    def parse_photo_name(photo_name)
      name, city_name, photo_date = photo_name.split(SEPARATOR).map(&:strip)
      extension = File.extname(name)

      {
        extension:,
        name: File.basename(name, extension),
        city: city_repository.find_or_create_by(name: city_name),
        date: DateTime.strptime(photo_date, DATE_FORMAT)
      }
    end

    def city_repository
      @city_repository ||= Repository::CityRepository.new
    end
  end
end
