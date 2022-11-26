# frozen_string_literal: true

require 'store/memory_store'

module Repository
  # Abstract repository
  class BaseRepository
    def initialize(*); end

    class << self
      def store
        @store ||= default_store
      end

      def find_or_create_by(); end

      private

      def default_store
        Store::MemoryStore.instance
      end
    end
  end
end
