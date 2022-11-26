# frozen_string_literal: true

require_relative 'base_organizer'
require 'helper/digits_helper'

module Organizer
  # Organizes photos per city
  class CityOrganzier < BaseOrganizer
    extend Helper::DigitsHelper

    class << self
      def organize_photos!(photos)
        photos.group_by(&:city).each_value do |photos_per_city|
          rename_photos!(photos_per_city)
        end
      end

      private

      def rename_photos!(group)
        max_digits = number_of_digits(group.length)
        sorted_photos = group.sort_by(&:date)

        sorted_photos.each.with_index do |photo, index|
          number = (index + 1).to_s.rjust(max_digits, '0')
          photo.name = "#{photo.city.name}#{number}"
        end
      end
    end
  end
end
