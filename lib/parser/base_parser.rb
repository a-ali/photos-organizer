# frozen_string_literal: true

require_relative 'photo_name_parser'

module Parser
  # Abstract photos parser
  class BaseParser
    include PhotoNameParser

    def initialize(*); end

    def photos
      []
    end
  end
end
