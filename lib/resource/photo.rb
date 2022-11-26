# frozen_string_literal: true

require_relative 'base_resource'
module Resource
  class Photo < BaseResource
    attributes %i[name extension date city]

    def to_s
      "#{name}#{extension}"
    end
  end
end
