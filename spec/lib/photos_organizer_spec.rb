# frozen_string_literal: true

require 'photos_organizer'
require 'organizer/base_organizer'
require 'parser/base_parser'

RSpec.describe PhotosOrganizer do
  let(:parser) { instance_double(Parser::BaseParser) }
  let(:organizer) { class_double(Organizer::BaseOrganizer) }
  let(:app) { described_class.new(parser:, organizer:) }

  it 'parses photos' do
    allow(parser).to receive(:photos)
    app
    expect(parser).to have_received(:photos).once
  end

  describe '#organize_photots!' do
    it 'asks the organizer to organize photots' do
      allow(organizer).to receive(:organize_photos!)
      allow(parser).to receive(:photos)
      app.organize_photos!
      expect(organizer).to have_received(:organize_photos!).once
    end
  end
end
