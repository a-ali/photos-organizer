# frozen_string_literal: true

module Store
  class NullStore
    def find_by(*); end
    def create(_); end
  end
end
