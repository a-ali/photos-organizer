# frozen_string_literal: true

require_relative 'base_parser'
require 'resource/photo'

module Parser
  # Parses the photos from a string source
  class StringParser < BaseParser
    NEW_LINE = "\n"

    def initialize(str, separator: NEW_LINE)
      self.source = str
      self.separator = separator
      super
    end

    def photos
      source.split(separator).map do |photo_name|
        attrs = parse_photo_name(photo_name)
        yield(Resource::Photo.new(**attrs))
      end
    end

    private

    attr_accessor :source, :separator
  end
end
