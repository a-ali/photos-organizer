# frozen_string_literal: true

require 'store/memory_store'

module Repository
  # Abstract repository
  class BaseRepository
    attr_reader :store

    def initialize(store: default_store)
      @store = store
    end

    def find_or_create_by(); end

    private

    def default_store
      Store::MemoryStore.instance
    end
  end
end
