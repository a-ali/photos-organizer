# frozen_string_literal: true

require_relative 'base_resource'

module Resource
  # City resource
  class City < BaseResource
    attributes %i[name]

    def ==(other)
      other.name == name
    end
  end
end
