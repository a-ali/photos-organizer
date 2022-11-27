# frozen_string_literal: true

require 'store/memory_store'
require 'resource/photo'

RSpec.describe Store::MemoryStore do
  let(:store) { described_class.instance }

  before { store.clear }

  describe '#find_by' do
    context 'when the record exists' do
      let(:item) { Resource::Photo.new(name: 'a', extension: '.jpg') }

      before { store.create(item) }

      it 'fetchs a record' do
        store.create item

        expect(store.find_by(name: 'a')).to eq(item)
        expect(store.find_by(extension: '.jpg')).to eq(item)
        expect(store.find_by(name: 'a', extension: '.jpg')).to eq(item)
      end
    end

    context 'when the record does not exist' do
      it 'returns nil' do
        expect(store.find_by(name: 'b')).to be_nil
        expect(store.find_by(extension: 'png')).to be_nil
        expect(store.find_by(name: 'b', extension: 'png')).to be_nil
      end
    end

    it 'returns the first matched item' do
      item1 = Resource::Photo.new(name: 'a', extension: '.jpg')
      item2 = Resource::Photo.new(name: 'a', extension: '.png')

      store.create(item1)
      store.create(item2)

      expect(store.find_by(name: 'a')).to eq(item1)
    end
  end

  describe '#create' do
    it 'stores the given item' do
      expect { store.create(Resource::Photo.new(name: 'a')) }.to change { store.find_by(name: 'a') }.from(nil)
    end
  end
end
