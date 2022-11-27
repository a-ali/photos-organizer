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

    def photos(&block)
      @photos ||= parse_photos

      if block
        @photos.each(&block)
      else
        @photos
      end
    end

    private

    attr_accessor :source, :separator

    def parse_photos
      source.split(separator).map do |photo_name|
        attrs = parse_photo_name(photo_name)
        Resource::Photo.new(**attrs)
      end
    end
  end
end
