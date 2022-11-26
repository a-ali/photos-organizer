# frozen_string_literal: true

module Helper
  module DigitsHelper
    def number_of_digits(number)
      return 1 if number.zero?
      return number_of_digits(-number) if number.negative?

      Math.log10(number).to_i + 1
    end
  end
end
