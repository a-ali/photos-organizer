# frozen_string_literal: true

require 'helper/photo_name_helper'

class PhotoNameHelperClient
  extend Helper::PhotoNameHelper
end

RSpec.describe Helper::PhotoNameHelper do
  describe '.parse_photo_name' do
    it "prases given photo's name" do
      name = 'notredame.png, Florianopolis, 2015-09-01 12:01:50'
      result = PhotoNameHelperClient.parse_photo_name(name)

      expect(result[:name]).to eq('notredame')
      expect(result[:extension]).to eq('.png')
      expect(result[:city]).to eq(Resource::City.new(name: 'Florianopolis'))
      expect(result[:date]).to eq(DateTime.new(2015, 9, 1, 12, 1, 50))
    end
  end
end
