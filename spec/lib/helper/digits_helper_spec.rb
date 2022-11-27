# frozen_string_literal: true

require 'helper/digits_helper'

class DigitsHelperClient
  extend Helper::DigitsHelper
end

RSpec.describe Helper::DigitsHelper do
  describe '.number_of_digits' do
    it 'returns number of digits in a number' do
      [
        [-100, 3],
        [-10, 2],
        [-1, 1],
        [0, 1],
        [1, 1],
        [9, 1],
        [10, 2],
        [99, 2],
        [100, 3],
        [101, 3]
      ].each do |(number, digits)|
        expect(DigitsHelperClient.number_of_digits(number)).to eq(digits), "number: #{number}, digits: #{digits}"
      end
    end
  end
end
