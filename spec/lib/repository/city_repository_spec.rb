# frozen_string_literal: true

require 'repository/city_repository'
require 'resource/city'

RSpec.describe Repository::CityRepository do
  # it { is_expected.to has_attribute(:name) }
  describe '.find_or_create_by' do
    let(:store) { Store::NullStore.new }
    let(:repo) { described_class.new(store:) }

    context 'when the record is present' do
      it 'returns the record' do
        object = Resource::City.new(name: "City_#{rand(1..10)}")
        allow(store).to receive(:find_by).and_return object

        expect(repo.find_or_create_by(name: '')).to eq(object)
      end
    end

    context 'when the record is not present' do
      it 'creates the record' do
        allow(store).to receive(:create)
        object = repo.find_or_create_by(name: 'new_city')

        expect(object).to be_truthy
        expect(object.name).to eq('new_city')
        expect(store).to have_received(:create).with(object)
      end
    end
  end
end
