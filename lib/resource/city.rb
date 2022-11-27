# frozen_string_literal: true

require_relative 'base_resource'

module Resource
  # City resource
  class City < BaseResource
    attributes %i[name]
  end
end
