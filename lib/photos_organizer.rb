# frozen_string_literal: true

# PhotosOrganizer App
class PhotosOrganizer
  attr_reader :photos

  def initialize(parser:, organizer:)
    self.parser = parser
    self.photos = []
    self.organizer = organizer

    parser.photos do |photo|
      photos << photo
    end
  end

  def organize_photos!
    organizer.organize_photos!(photos)
  end

  private

  attr_accessor :parser, :organizer
  attr_writer :photos
end
