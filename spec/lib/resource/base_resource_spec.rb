# frozen_string_literal: true

require 'resource/base_resource'

DummyResource = Class.new(Resource::BaseResource) do
  attributes %i[id email]
end

RSpec.describe Resource::BaseResource do
  describe '.attributes' do
    it 'defines getters for given attributes' do
      obj = DummyResource.new(id: 1, email: 'test@example.com')

      expect(obj.id).to eq(1)
      expect(obj.email).to eq('test@example.com')
    end

    it 'defines setters for given attributes' do
      obj = DummyResource.new
      obj.id = 1
      obj.email = 'test@example.com'

      expect(obj.id).to eq(1)
      expect(obj.email).to eq('test@example.com')
    end
  end

  describe '#attributes' do
    it 'returns the defined attributes' do
      expect(DummyResource.new.attributes).to eq(%i[id email])
    end
  end

  describe '==' do
    it 'compares all attributes' do
      expect(DummyResource.new(id: 1, email: 'a') == DummyResource.new(id: 1, email: '')).to be_falsey
      expect(DummyResource.new(id: 2, email: 'a') == DummyResource.new(id: 1, email: 'a')).to be_falsey
      # rubocop:disable Lint/BinaryOperatorWithIdenticalOperands
      expect(DummyResource.new(id: 1, email: '') == DummyResource.new(id: 1, email: '')).to be_truthy
      # rubocop:enable Lint/BinaryOperatorWithIdenticalOperands
    end
  end
end
