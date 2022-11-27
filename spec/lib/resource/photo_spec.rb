# frozen_string_literal: true

require 'resource/photo'

RSpec.describe Resource::Photo do
  it { is_expected.to has_attribute(:name) }
  it { is_expected.to has_attribute(:extension) }
  it { is_expected.to has_attribute(:date) }
  it { is_expected.to has_attribute(:city) }

  describe '#to_s' do
    it 'returns the name with extension' do
      expect(described_class.new(name: 'image', extension: '.png').to_s).to eq('image.png')
    end
  end
end
