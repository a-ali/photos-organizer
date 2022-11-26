# frozen_string_literal: true

require_relative 'base_store'

module Store
  # In memory store
  class MemoryStore < BaseStore
    # Searches the stored record
    # Returns the first record whose attributes equals the given attributes
    def find_by(**attributes)
      records.find do |item|
        item.attributes.reduce(true) do |acc, attr|
          acc && item.public_send(attr) == attributes[attr]
        end
      end
    end

    def create(record)
      records << record
    end

    private

    def records
      @records ||= []
    end
  end
end
