# frozen_string_literal: true

require 'singleton'

module Store
  # Abstract store
  class BaseStore
    include Singleton

    def find_by(*); end
    def create(_); end
  end
end
